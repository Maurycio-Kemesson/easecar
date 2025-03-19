import 'package:either_dart/either.dart';

import '../../data/models/brand_model.dart';
import '../../data/models/vehicle_model.dart';

abstract class HomeRepository {
  Future<Either<Exception, List<BrandModel>>> fetchBrands();
  Future<Either<Exception, List<VehicleModel>>> fetchNewVehicles();
  Future<Either<Exception, List<VehicleModel>>> fetchUsedVehicles();
}
