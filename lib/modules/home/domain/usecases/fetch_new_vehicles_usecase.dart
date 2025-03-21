import 'package:either_dart/either.dart';

import '../../data/models/vehicle_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchNewVehiclesUsecase {
  Future<Either<Exception, List<VehicleModel>>> call();
}

class FetchNewVehiclesUsecaseImp implements FetchNewVehiclesUsecase {
  HomeRepository repository;

  FetchNewVehiclesUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, List<VehicleModel>>> call() async {
    return repository.fetchNewVehicles();
  }
}
