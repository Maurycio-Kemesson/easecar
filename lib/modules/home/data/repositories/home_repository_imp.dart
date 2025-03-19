import 'package:easecar/modules/home/data/models/brand_model.dart';
import 'package:either_dart/either.dart';

import '../../domain/repositories/home_repository.dart';
import '../datasource/home_datasource.dart';
import '../models/vehicle_model.dart';

class HomeRepositoryImp implements HomeRepository {
  HomeDatasource datasource;

  HomeRepositoryImp({required this.datasource});

  @override
  Future<Either<Exception, List<BrandModel>>> fetchBrands() async {
    try {
      var data = await datasource.fetchBrands();
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<VehicleModel>>> fetchNewVehicles() async {
    try {
      var data = await datasource.fetchNewVehicles();
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }

  @override
  Future<Either<Exception, List<VehicleModel>>> fetchUsedVehicles() async {
    try {
      var data = await datasource.fetchUsedVehicles();
      return Right(data);
    } on Exception catch (e) {
      return Left(e);
    }
  }
}
