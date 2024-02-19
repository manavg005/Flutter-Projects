import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_study_app/firebase/loading_status.dart';
import 'package:flutter_study_app/firebase/references.dart';
import 'package:flutter_study_app/models/question_paper_model.dart';
import 'package:get/get.dart';

class DataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }

  final loadingStatus = LoadingStatus.completed.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final firestore = FirebaseFirestore.instance;
    log("Uploading Data");
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString("AssetManifest.json");
    final Map<String, dynamic> manifest = jsonDecode(manifestContent);
    final papersAssets = manifest.keys
        .where((element) =>
            element.startsWith("assets/DB/papers") && element.contains('.json'))
        .toList();
    log("$papersAssets");
    List<QuestionPaperModel> questionPaper = [];
    for (var paper in papersAssets) {
      String papers = await rootBundle.loadString(paper);
      log(papers);
      questionPaper.add(QuestionPaperModel.fromJson(json.decode(papers)));
    }
    var batch = firestore.batch();
    for (var papers in questionPaper) {
      batch.set(questionPaperRF.doc(papers.id), {
        "title": papers.title,
        "image_url": papers.imageUrl,
        "description": papers.description,
        "timeSeconds": papers.timeSeconds,
        "questions_count":
            papers.questions == null ? 0 : papers.questions!.length,
      });
      for (var question in papers.questions!) {
        final questionPath =
            questionRF(paperId: papers.id!, questionId: question.id!);
        batch.set(questionPath, {
          "question": question.question,
          "correctAnswer": question.correctAnswer,
        });
        for (var answer in question.answers!) {
          batch.set(questionPath.collection('answer').doc(answer.identifier), {
            'identifier': answer.identifier,
            'answer': answer.answer,
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
