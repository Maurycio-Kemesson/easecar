import 'package:easecar/app/theme/app_colors.dart';
import 'package:localization/localization.dart';
import 'package:flutter/material.dart'; // Para usar a classe Color

enum VehicleStatusEnum { approved, rejected, underReview }

extension VehicleStatusEnumExtension on VehicleStatusEnum {
  String get value {
    switch (this) {
      case VehicleStatusEnum.approved:
        return 'vehicleStatusApproved'.i18n();
      case VehicleStatusEnum.rejected:
        return 'vehicleStatusRejected'.i18n();
      case VehicleStatusEnum.underReview:
        return 'vehicleStatusUnderAnalysis'.i18n();
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case VehicleStatusEnum.approved:
        return AppColors.brightGreen;
      case VehicleStatusEnum.rejected:
        return AppColors.intenseRedGreen;
      case VehicleStatusEnum.underReview:
        return AppColors.statePadding;
      default:
        return AppColors.primaryColor;
    }
  }
}
