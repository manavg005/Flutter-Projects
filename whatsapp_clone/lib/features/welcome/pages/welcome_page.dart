import 'package:flutter/material.dart';
import 'package:whatsapp_clone/common/extensions/customs_theme_extension.dart';
import 'package:whatsapp_clone/common/utils/colours.dart';

import '../../../common/routes/routes.dart';
import '../../../common/widgets/custom_elevated_button.dart';
import '../widgets/language_button.dart';
import '../widgets/privacy_and_terms.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);
  navigateToLoginPage(context) {
    Navigator.of(context)
        .pushNamedAndRemoveUntil(Routes.login, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
                child: Image.asset(
                  'assets/images/circle.png',
                  color: context.theme.circleImageColor,
                ),
              ),
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'Welcome to WhatsApp',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                PrivacyAndTerms(),
                CustomElevatedButton(
                    onPressed: () {
                      navigateToLoginPage(context);
                    },
                    text: 'AGREE AND CONTINUE'),
                const SizedBox(
                  height: 50,
                ),
                LanguageButton(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
