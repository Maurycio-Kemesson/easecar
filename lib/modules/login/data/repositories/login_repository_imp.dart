import 'package:either_dart/either.dart';

import '../../domain/repositories/login_repository.dart';
import '../datasource/login_datasource.dart';

class LoginRepositoryImp implements LoginRepository {
  LoginDatasource datasource;

  LoginRepositoryImp({required this.datasource});

  @override
  Future<Either<Exception, bool>> login({
    required String email,
    required String password,
  }) async {
    try {
      var data = await datasource.login(login: email, password: password);
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
