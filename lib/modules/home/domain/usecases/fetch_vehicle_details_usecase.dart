import 'package:either_dart/either.dart';

import '../../data/models/vehicle_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchVehicleDetailsUsecase {
  Future<Either<Exception, VehicleModel>> call(String id);
}

class FetchVehicleDetailsUsecaseImp implements FetchVehicleDetailsUsecase {
  HomeRepository repository;

  FetchVehicleDetailsUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, VehicleModel>> call(String id) async {
    return repository.fetchVehicleDetails(id);
  }
}
