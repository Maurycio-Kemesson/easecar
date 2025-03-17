import 'package:easecar/modules/login/data/datasource/login_datasource.dart';
import 'package:easecar/modules/login/data/datasource/remote/login_datasource_imp.dart';
import 'package:easecar/modules/login/data/repositories/login_repository_imp.dart';
import 'package:easecar/modules/login/domain/repositories/login_repository.dart';
import 'package:easecar/modules/login/domain/usecases/login_usecase.dart';
import 'package:easecar/modules/login/presentation/controllers/login_controller.dart';
import 'package:easecar/modules/login/presentation/pages/login_options_page.dart';
import 'package:easecar/modules/login/presentation/pages/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../app/app_routes.dart';

class LoginModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    i.addLazySingleton<LoginDatasource>(LoginDatasourceImp.new);
    i.addLazySingleton<LoginRepository>(LoginRepositoryImp.new);
    i.addLazySingleton<LoginrUsecase>(
      LoginrUsecaseImp.new,
    );
    i.addLazySingleton<LoginController>(LoginControllerImp.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.init, child: (_) => const LoginOptionsPage());
    r.child(AppRoutes.login, child: (_) => const LoginPage());
    super.routes(r);
  }
}
