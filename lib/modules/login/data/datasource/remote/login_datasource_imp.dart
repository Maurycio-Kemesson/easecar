import 'package:firebase_auth/firebase_auth.dart';

import '../login_datasource.dart';

class LoginDatasourceImp implements LoginDatasource {
  @override
  Future<bool> login({required String login, required String password}) async {
    try {
      final userCredential =
          await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: login,
        password: password,
      );
      return userCredential.user != null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          throw Exception('O endereço de e-mail está mal formatado.');
        case 'user-disabled':
          throw Exception('O usuário com este e-mail foi desativado.');
        case 'user-not-found':
          throw Exception('Nenhum usuário encontrado com este e-mail.');
        case 'wrong-password':
          throw Exception('A senha está incorreta.');
        default:
          throw Exception('Erro desconhecido ao fazer login.');
      }
    } catch (e) {
      throw Exception('$e');
    }
  }
}
