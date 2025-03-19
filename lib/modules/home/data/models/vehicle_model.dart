import '../../domain/enuns/vehicle_status_enum.dart';
import '../../domain/enuns/store_type_enum.dart';
import 'brand_model.dart';

class VehicleModel {
  String id;
  String model;
  int km;
  String color;
  double oldValue;
  double newValue;
  String city;
  String state;
  StoreTypeEnum storeType;
  VehicleStatusEnum status;
  BrandModel brand;

  VehicleModel({
    required this.id,
    required this.model,
    required this.km,
    required this.color,
    required this.oldValue,
    required this.newValue,
    required this.city,
    required this.state,
    required this.storeType,
    required this.status,
    required this.brand,
  });

  factory VehicleModel.fromJson(Map<String, dynamic> json) {
    return VehicleModel(
      id: json['id'],
      model: json['model'],
      km: json['km'],
      color: json['color'],
      oldValue: json['old_value'],
      newValue: json['new_value'],
      city: json['city'],
      state: json['state'],
      storeType: StoreTypeEnum.values
          .firstWhere((e) => e.toString() == 'StoreType.${json['store_type']}'),
      status: VehicleStatusEnum.values
          .firstWhere((e) => e.toString() == 'CarStatus.${json['status']}'),
      brand: json['brand'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'model': model,
      'km': km,
      'color': color,
      'old_value': oldValue,
      'new_value': newValue,
      'city': city,
      'state': state,
      'store_type': storeType.toString().split('.').last,
      'status': status.toString().split('.').last,
      'brand': brand,
    };
  }
}
