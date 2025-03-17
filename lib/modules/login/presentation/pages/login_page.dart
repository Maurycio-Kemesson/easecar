import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/validators/email_validator.dart';
import 'package:easecar/core/validators/validation_utils.dart';
import 'package:easecar/core/widgets/body_custom.dart';
import 'package:easecar/core/widgets/elevated_button_custom.dart';
import 'package:easecar/core/widgets/text_button_custom.dart';
import 'package:easecar/core/widgets/text_form_fild_custom.dart';
import 'package:easecar/modules/login/presentation/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controllerLogin = Modular.get<LoginController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: IconButton(
          iconSize: 30,
          onPressed: () {
            Modular.to.pop();
          },
          icon: const Icon(
            Icons.keyboard_arrow_left_rounded,
            color: AppColors.white,
          ),
        ),
        backgroundColor: AppColors.primaryColor,
      ),
      backgroundColor: AppColors.primaryColor,
      body: BodyCustom(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "access".i18n(),
              style: TextStyleCustom.titleStyle,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                "with_email_and_password_to_log_in".i18n(),
                style: TextStyleCustom.subtitleLoginStyle,
              ),
            ),
            Expanded(
              flex: 2,
              child: Form(
                key: controllerLogin.formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 21),
                      child: TextFormFieldCustom(
                        title: "email".i18n(),
                        hintText: "type_your_email".i18n(),
                        keyboardType: TextInputType.emailAddress,
                        textEditingController: controllerLogin.loginController,
                        validator: (p0) {
                          if (ValidationCustomUtils.validateEmpty(p0)) {
                            return "required_field".i18n();
                          }
                          if (EmailValidator.validateEmail(p0)) {
                            return "invalid_email".i18n();
                          }
                          return null;
                        },
                      ),
                    ),
                    ValueListenableBuilder<bool>(
                        valueListenable: controllerLogin.isPasswordObscured,
                        builder: (context, isPasswordObscured, child) {
                          return TextFormFieldCustom(
                            title: "password".i18n(),
                            hintText: "type_your_password".i18n(),
                            obscureText:
                                controllerLogin.isPasswordObscured.value,
                            validator: (p0) {
                              if (ValidationCustomUtils.validateEmpty(p0)) {
                                return "required_field".i18n();
                              }
                              return null;
                            },
                            suffixIcon: IconButton(
                              icon: Icon(
                                controllerLogin.isPasswordObscured.value
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 22,
                                color: const Color(0xff9D9D9D),
                              ),
                              onPressed: () {
                                controllerLogin.togglePasswordVisibility();
                              },
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textEditingController:
                                controllerLogin.passwordController,
                          );
                        }),
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 16,
                                width: 16,
                                child: ValueListenableBuilder<bool>(
                                    valueListenable: controllerLogin.saveAccess,
                                    builder:
                                        (context, isPasswordObscured, child) {
                                      return Checkbox(
                                        activeColor: const Color(0xff7CB3D2),
                                        splashRadius: 30,
                                        side: WidgetStateBorderSide.resolveWith(
                                          (states) => const BorderSide(
                                            width: 1.0,
                                            color: AppColors.white,
                                          ),
                                        ),
                                        value: controllerLogin.saveAccess.value,
                                        onChanged: (value) {
                                          controllerLogin.saveAccessToggle();
                                        },
                                      );
                                    }),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 6),
                                child: Text(
                                  "keep_me_logged_in".i18n(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                          TextButtonCustom(
                            onPressed: () {
                              Modular.to.pushNamed('/auth/redefine-password');
                            },
                            title: "i_forgot_my_password".i18n(),
                            underlinedText: true,
                            styleText: const TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ValueListenableBuilder<bool>(
                    valueListenable: controllerLogin.isLoading,
                    builder: (context, isLoading, child) {
                      return ElevatedButtonCustom(
                        onPressed: () {
                          controllerLogin.login(
                            email: controllerLogin.loginController.text,
                            password: controllerLogin.passwordController.text,
                            context: context,
                          );
                        },
                        backgroudColor: AppColors.tertiaryColor,
                        isLoading: isLoading,
                        title: "to_enter".i18n(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
