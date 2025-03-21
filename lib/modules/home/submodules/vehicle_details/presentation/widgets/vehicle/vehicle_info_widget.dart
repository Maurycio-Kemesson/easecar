import 'package:flutter/material.dart';
import 'package:localization/localization.dart';
import '../../../../../../../app/theme/app_dimensions.dart';
import '../../../../../data/models/vehicle_model.dart';
import 'text_title_widget.dart';
import 'text_value_widget.dart';

class VehicleInfoWidget extends StatelessWidget {
  final VehicleModel vehicleInfo;

  const VehicleInfoWidget({
    Key? key,
    required this.vehicleInfo,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: AppDimensions.mediumExtra,
        bottom: AppDimensions.small,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoItem(
                  'vehicleDetailsYear'.i18n(),
                  '${vehicleInfo.year}',
                ),
                _buildInfoItem(
                  'vehicleDetailsDoors'.i18n(),
                  '${vehicleInfo.doors}',
                ),
                _buildInfoItem(
                  'vehicleDetailsArmored'.i18n(),
                  '${vehicleInfo.armored}',
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildInfoItem(
                  'vehicleDetailsGearbox'.i18n(),
                  vehicleInfo.gearbox,
                ),
                _buildInfoItem(
                  'vehicleDetailsFuel'.i18n(),
                  vehicleInfo.fuel,
                ),
                _buildInfoItem(
                  'vehicleDetailsColor'.i18n(),
                  vehicleInfo.color,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimensions.smallMedium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextTitleWidget(title: title),
          TextValueWidget(value: value),
        ],
      ),
    );
  }
}
