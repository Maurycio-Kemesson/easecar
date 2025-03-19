import 'package:easecar/modules/home/data/models/brand_model.dart';

import '../models/vehicle_model.dart';

abstract class HomeDatasource {
  Future<List<BrandModel>> fetchBrands();
  Future<List<VehicleModel>> fetchNewVehicles();
  Future<List<VehicleModel>> fetchUsedVehicles();
}
