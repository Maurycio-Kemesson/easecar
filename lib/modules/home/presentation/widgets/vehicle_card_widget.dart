import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:easecar/modules/home/domain/enuns/vehicle_status_enum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

import '../../data/models/vehicle_model.dart';
import 'story_type_widget.dart';

class VehicleCardWidget extends StatelessWidget {
  final VehicleModel vehicle;
  final Function()? onDetailsPressed;

  const VehicleCardWidget({
    Key? key,
    required this.vehicle,
    required this.onDetailsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(
        horizontal: AppDimensions.mediumExtra,
        vertical: AppDimensions.smallMedium,
      ),
      decoration: BoxDecoration(
        color: AppColors.softBlue,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          /* Image.asset(
            AppImages.vehicle,
            width: MediaQuery.of(context).size.width / 1.95,
            fit: BoxFit.cover,
          ), */
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(AppDimensions.smallExtra),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    spacing: AppDimensions.tinyExtra,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Flexible(
                        child: Text(
                          vehicle.model,
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SvgPicture.asset(AppIcons.edit)
                    ],
                  ),
                  Text(
                    '${vehicle.km}km/${vehicle.color}',
                    style: const TextStyle(
                      fontSize: 10,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.tiny),
                  RichText(
                    text: TextSpan(
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.primaryColor,
                      ),
                      children: [
                        TextSpan(
                          text: 'homeFrom'.i18n(),
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: AppColors.primaryColor,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.mediumGray,
                          ),
                        ),
                        TextSpan(
                          text: ' ${formatter.format(vehicle.oldValue)}',
                          style: const TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 10,
                            color: AppColors.mediumGray,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColors.mediumGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    formatter.format(vehicle.newValue),
                    style: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    '${vehicle.city}/${vehicle.state}',
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: AppDimensions.tiny),
                  StoreTypeWidget(type: vehicle.storeType),
                  const SizedBox(height: AppDimensions.tinyExtra),
                  Container(
                    decoration: BoxDecoration(
                      color: vehicle.status.color,
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.tinyExtra,
                      vertical: AppDimensions.line,
                    ),
                    child: Text(
                      vehicle.status.value,
                      style: const TextStyle(
                        fontSize: 12,
                        color: AppColors.white,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: AppDimensions.tiny),
                  TextButton(
                    onPressed: onDetailsPressed,
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      minimumSize: const Size(0, 0),
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                    child: Text(
                      'homeSeeDetails'.i18n(),
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                        decorationColor: AppColors.primaryColor,
                        height: 2,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
