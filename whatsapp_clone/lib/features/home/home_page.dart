import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/models/user_model.dart';
import 'package:whatsapp_clone/features/auth/controller/auth_controller.dart';
import 'package:whatsapp_clone/features/auth/widgets/custom_icon_button.dart';
import 'package:whatsapp_clone/features/home/chat_home_page.dart';
import 'package:whatsapp_clone/features/home/status_page.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  late Timer timer;

  updateUserPresence() {
    ref.read(authControllerProvider).updateUserPresence();
  }

  @override
  void initState() {
    updateUserPresence();
    timer =
        Timer.periodic(const Duration(minutes: 1), (timer) => setState(() {}));
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "WhatsApp",
            style: TextStyle(letterSpacing: 1),
          ),
          elevation: 1,
          actions: [
            CustomIconButton(onTap: () {}, icon: Icons.search),
            CustomIconButton(onTap: () {}, icon: Icons.more_vert)
          ],
          bottom: TabBar(
            tabs: [
              Tab(
                text: "CHATS",
              ),
              Tab(
                text: "STATUS",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ChatHomePage(),
            StatusPage(),
          ],
        ),
      ),
    );
  }
}
