import 'package:flutter/material.dart';
import 'package:flutter_study_app/widgets/app_circle_button.dart';
import 'package:get/get.dart';

class AppIntroduction extends StatelessWidget {
  const AppIntroduction({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: Get.width * .2),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star),
              const Text(
                  "This is a study appp dk js dhbv bcjhvcb jdbsns dbsndbsn bdb bdhs  dbsb dsbds b hbd"),
              CircleButton(
                onTap: () => null,
                child: Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
