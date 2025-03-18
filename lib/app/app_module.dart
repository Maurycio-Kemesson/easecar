import 'package:flutter_modular/flutter_modular.dart';

import 'package:easecar/modules/home/home_module.dart';
import 'package:easecar/modules/login/login_module.dart';

const appTransition = TransitionType.rightToLeft;

class AppModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void routes(RouteManager r) {
    r.module(
      Modular.initialRoute,
      transition: appTransition,
      module: LoginModule(),
    );
    r.module(
      Modular.initialRoute,
      transition: appTransition,
      module: HomeModule(),
    );
  }
}
