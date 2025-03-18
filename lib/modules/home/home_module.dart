import 'package:easecar/app/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    i.addLazySingleton<HomeController>(HomeControllerImp.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.home, child: (_) => const HomePage());
    super.routes(r);
  }
}
