import 'package:either_dart/either.dart';

import '../../data/models/vehicle_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchUsedVehiclesUsecase {
  Future<Either<Exception, List<VehicleModel>>> call();
}

class FetchUsedVehiclesUsecaseImp implements FetchUsedVehiclesUsecase {
  HomeRepository repository;

  FetchUsedVehiclesUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, List<VehicleModel>>> call() async {
    return repository.fetchUsedVehicles();
  }
}
