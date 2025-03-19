import 'package:either_dart/either.dart';

import '../../data/models/brand_model.dart';
import '../repositories/home_repository.dart';

abstract class FetchBrandsUsecase {
  Future<Either<Exception, List<BrandModel>>> call();
}

class FetchBrandsUsecaseImp implements FetchBrandsUsecase {
  HomeRepository repository;

  FetchBrandsUsecaseImp({required this.repository});

  @override
  Future<Either<Exception, List<BrandModel>>> call() async {
    return repository.fetchBrands();
  }
}
