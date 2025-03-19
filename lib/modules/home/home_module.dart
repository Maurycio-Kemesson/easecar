import 'package:easecar/app/app_routes.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'data/datasource/home_datasource.dart';
import 'data/datasource/remote/home_datasource_imp.dart';
import 'data/repositories/home_repository_imp.dart';
import 'domain/repositories/home_repository.dart';
import 'domain/usecases/fetch_brands_usecase.dart';
import 'domain/usecases/fetch_new_vehicles_usecase.dart';
import 'domain/usecases/fetch_used_vehicles_usecase.dart';
import 'presentation/controllers/home_controller.dart';
import 'presentation/pages/home_page.dart';

class HomeModule extends Module {
  @override
  List<Module> get imports => [];

  @override
  void binds(i) {
    i.addLazySingleton<HomeDatasource>(HomeDatasourceImp.new);

    i.addLazySingleton<HomeRepository>(HomeRepositoryImp.new);

    i.addLazySingleton<FetchBrandsUsecase>(FetchBrandsUsecaseImp.new);
    i.addLazySingleton<FetchNewVehicles>(FetchNewVehiclesImp.new);
    i.addLazySingleton<FetchUsedVehicles>(FetchUsedVehiclesImp.new);

    i.addLazySingleton<HomeController>(HomeControllerImp.new);
  }

  @override
  void routes(RouteManager r) {
    r.child(AppRoutes.home, child: (_) => const HomePage());
    super.routes(r);
  }
}
