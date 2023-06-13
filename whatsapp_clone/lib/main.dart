import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:whatsapp_clone/common/extensions/customs_theme_extension.dart';
import 'package:whatsapp_clone/common/theme/darktheme.dart';
import 'package:whatsapp_clone/common/theme/lighttheme.dart';
import 'package:whatsapp_clone/features/auth/pages/login_page.dart';
import 'package:whatsapp_clone/features/auth/pages/user_info.dart';
import 'package:whatsapp_clone/features/welcome/pages/welcome_page.dart';

import 'common/routes/routes.dart';
import 'features/auth/controller/auth_controller.dart';
import 'features/auth/pages/verification_page.dart';
import 'features/home/home_page.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: lightTheme(),
      darkTheme: darkTheme(),
      themeMode: ThemeMode.system,
      title: 'WhatsApp Clone',
      home: ref.watch(userInfoAuthProvider).when(
        data: (user) {
          FlutterNativeSplash.remove();
          if (user == null) return const WelcomePage();
          return const HomePage();
        },
        error: (error, trace) {
          return const Scaffold(
            body: Center(
              child: Text('Something wrong happened'),
            ),
          );
        },
        loading: () {
          return Scaffold(
            body: Center(
              child: Icon(
                Icons.message,
                size: 30,
              ),
            ),
          );
        },
      ),
      onGenerateRoute: Routes.onGenerateRoute,
    );
  }
}
