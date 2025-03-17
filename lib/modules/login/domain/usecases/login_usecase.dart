import 'package:either_dart/either.dart';

import '../repositories/login_repository.dart';

abstract class LoginrUsecase {
  Future<Either<Exception, bool>> call({
    required String email,
    required String password,
  });
}

class LoginrUsecaseImp implements LoginrUsecase {
  LoginRepository repository;

  LoginrUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, bool>> call({
    required String email,
    required String password,
  }) async {
    return repository.login(email: email, password: password);
  }
}
