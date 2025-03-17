import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/widgets/body_custom.dart';
import 'package:easecar/core/widgets/elevated_button_custom.dart';
import 'package:easecar/core/widgets/text_button_custom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

class LoginOptionsPage extends StatefulWidget {
  const LoginOptionsPage({super.key});

  @override
  State<LoginOptionsPage> createState() => _LoginOptionsPageState();
}

class _LoginOptionsPageState extends State<LoginOptionsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.primaryColor,
      body: BodyCustom(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/logo/logo-vertical.svg",
              color: Colors.white,
              width: 182,
              height: 107,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50, bottom: 14),
              child: Text(
                'how_do_you_want_to_access'.i18n(),
                style: TextStyleCustom.subtitleStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ElevatedButtonCustom(
                title: 'to_do_login'.i18n(),
                backgroudColor: AppColors.tertiaryColor,
                onPressed: () {
                  Modular.to.pushNamed('/login');
                },
              ),
            ),
            ElevatedButtonCustom(
              title: 'make_your_register'.i18n(),
              colorText: AppColors.secondaryColor,
              backgroudColor: AppColors.white,
              onPressed: () {
                Modular.to.pushNamed('/register/user-register');
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextButtonCustom(
                title: 'login_without_registration'.i18n(),
                underlinedText: true,
                onPressed: () {
                  Modular.to.navigate('/home');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
