import 'package:easecar/core/conts/icons.dart';

import '../../../domain/enuns/store_type_enum.dart';
import '../../../domain/enuns/vehicle_status_enum.dart';
import '../../models/brand_model.dart';
import '../../models/vehicle_model.dart';
import '../home_datasource.dart';

class HomeDatasourceImp implements HomeDatasource {
  @override
  Future<List<BrandModel>> fetchBrands() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
      BrandModel(name: 'Fiat', image: AppIcons.fiat),
      BrandModel(name: 'Ford', image: AppIcons.ford),
      BrandModel(name: 'Citroen', image: AppIcons.citroen),
      BrandModel(name: 'Honda', image: AppIcons.honda),
    ];
  }

  @override
  Future<List<VehicleModel>> fetchNewVehicles() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      VehicleModel(
        id: '1',
        model: 'Honda Civic 2024',
        km: 0,
        color: 'Prata',
        oldValue: 120000.00,
        newValue: 115000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        brand: BrandModel(name: 'Honda', image: AppIcons.honda),
      ),
      VehicleModel(
        id: '4',
        model: 'Ford Ranger 2024',
        km: 0,
        color: 'Prata London',
        oldValue: 199990.00,
        newValue: 189990.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        brand: BrandModel(name: 'Ford', image: AppIcons.ford),
      ),
      VehicleModel(
        id: '1',
        model: 'Citroën C3 2024',
        km: 0,
        color: 'Branco Perolizado',
        oldValue: 79990.00,
        newValue: 76990.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        brand: BrandModel(name: 'Citroen', image: AppIcons.citroen),
      ),
      VehicleModel(
        id: '4',
        model: 'Hyundai Creta 2024',
        km: 0,
        color: 'Branco',
        oldValue: 95000.00,
        newValue: 92000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        brand: BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
      ),
      VehicleModel(
        id: '5',
        model: 'Ford Ecosport 2024',
        km: 0,
        color: 'Azul',
        oldValue: 85000.00,
        newValue: 83000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.rejected,
        brand: BrandModel(name: 'Ford', image: AppIcons.ford),
      ),
    ];
  }

  @override
  Future<List<VehicleModel>> fetchUsedVehicles() async {
    await Future.delayed(const Duration(seconds: 2));
    return [
      VehicleModel(
        id: '1',
        model: 'HB20 2017',
        km: 50000,
        color: 'Branco',
        oldValue: 15000.00,
        newValue: 13000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.approved,
        brand: BrandModel(name: 'Hyundai', image: AppIcons.hyundai),
      ),
      VehicleModel(
        id: '2',
        model: 'Punto 2010',
        km: 30000,
        color: 'Preto',
        oldValue: 35000.00,
        newValue: 32000.00,
        city: 'Fortaleza',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.underReview,
        brand: BrandModel(name: 'Fiat', image: AppIcons.fiat),
      ),
      VehicleModel(
        id: '3',
        model: 'Fiat Uno 2020',
        km: 10000,
        color: 'Branco',
        oldValue: 45000.00,
        newValue: 43000.00,
        city: 'Caucaia',
        state: 'CE',
        storeType: StoreTypeEnum.dealership,
        status: VehicleStatusEnum.rejected,
        brand: BrandModel(name: 'Fiat', image: AppIcons.fiat),
      ),
    ];
  }
}
