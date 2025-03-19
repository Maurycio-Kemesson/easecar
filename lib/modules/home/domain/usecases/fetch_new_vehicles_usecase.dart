import 'package:either_dart/either.dart';

import '../../data/models/vehicle_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchNewVehicles {
  Future<Either<Exception, List<VehicleModel>>> call();
}

class FetchNewVehiclesImp implements FetchNewVehicles {
  HomeRepository repository;

  FetchNewVehiclesImp({required this.repository});

  @override
  Future<Either<Exception, List<VehicleModel>>> call() async {
    return repository.fetchNewVehicles();
  }
}
