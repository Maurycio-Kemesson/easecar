import 'package:localization/localization.dart';

enum VehicleConditionEnum {
  newVehicle,
  usedVehicle,
}

extension VehicleConditionEnumExtension on VehicleConditionEnum {
  String get value {
    switch (this) {
      case VehicleConditionEnum.newVehicle:
        return 'vehicleDetailsNew'.i18n();
      case VehicleConditionEnum.usedVehicle:
        return 'vehicleDetailsUsed'.i18n();
      default:
        return '';
    }
  }
}
