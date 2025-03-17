import 'package:either_dart/either.dart';

abstract class LoginRepository {
  Future<Either<Exception, bool>> login({
    required String email,
    required String password,
  });
}
