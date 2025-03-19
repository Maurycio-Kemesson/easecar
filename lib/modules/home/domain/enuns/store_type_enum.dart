import 'package:localization/localization.dart';

enum StoreTypeEnum { dealership }

extension StoreTypeEnumExtension on StoreTypeEnum {
  String get value {
    switch (this) {
      case StoreTypeEnum.dealership:
        return 'vehicleStoreTypeDealership'.i18n();
      default:
        return '';
    }
  }
}