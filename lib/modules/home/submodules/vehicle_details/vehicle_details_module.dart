import 'package:easecar/modules/home/home_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../app/app_routes.dart';
import 'presentation/controllers/vehicle_details_controller.dart';
import 'presentation/pages/vehicle_details_page.dart';

class VehicleDetailsModule extends Module {
  @override
  List<Module> get imports => [HomeModule()];

  @override
  void binds(i) {
    i.addLazySingleton<VehicleDetailsController>(
      VehicleDetailsControllerImp.new,
    );
  }

  @override
  void routes(RouteManager r) {
    r.child(
      AppRoutes.details,
      child: (_) => VehicleDetailsPage(id: r.args.data),
    );
    super.routes(r);
  }
}
