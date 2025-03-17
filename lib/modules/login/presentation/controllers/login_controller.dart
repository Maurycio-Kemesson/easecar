import 'package:easecar/modules/login/domain/usecases/login_usecase.dart';
import 'package:flutter/material.dart';

abstract class LoginController extends ChangeNotifier {
  ValueNotifier<bool> get isLoading;
  GlobalKey<FormState> get formKey;
  TextEditingController get loginController;
  TextEditingController get passwordController;
  ValueNotifier<bool> get isPasswordObscured;
  ValueNotifier<bool> get saveAccess;

  void login({
    required String email,
    required String password,
    required BuildContext context,
  });

  void togglePasswordVisibility();

  void saveAccessToggle();
}

class LoginControllerImp extends LoginController {
  LoginrUsecase loginrUsecase;

  LoginControllerImp({required this.loginrUsecase});

  @override
  ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  TextEditingController loginController = TextEditingController();

  @override
  TextEditingController passwordController = TextEditingController();

  @override
  ValueNotifier<bool> isPasswordObscured = ValueNotifier(true);

  @override
  ValueNotifier<bool> saveAccess = ValueNotifier(false);

  @override
  void login({
    required String email,
    required String password,
    required BuildContext context,
  }) {
    if (formKey.currentState?.validate() ?? false) {
      _login(context: context, email: email, password: password);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Verifique os campos obrigatórios')),
      );
    }
  }

  Future<void> _login({
    required String email,
    required String password,
    required BuildContext context,
  }) async {
    isLoading.value = true;

    var response = await loginrUsecase(email: email, password: password);
    response.fold(
      (err) {
        isLoading.value = false;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
              content:
                  Text('Erro ao tentar logar, tenta novamente mais tarde')),
        );
      },
      (data) async {
        isLoading.value = false;
      },
    );
  }

  @override
  void togglePasswordVisibility() {
    isPasswordObscured.value = !isPasswordObscured.value;
    notifyListeners();
  }

  @override
  void saveAccessToggle() {
    saveAccess.value = !saveAccess.value;
    notifyListeners();
  }
}
