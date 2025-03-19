import 'package:either_dart/either.dart';

import '../../data/models/vehicle_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchUsedVehicles {
  Future<Either<Exception, List<VehicleModel>>> call();
}

class FetchUsedVehiclesImp implements FetchUsedVehicles {
  HomeRepository repository;

  FetchUsedVehiclesImp({required this.repository});

  @override
  Future<Either<Exception, List<VehicleModel>>> call() async {
    return repository.fetchUsedVehicles();
  }
}
