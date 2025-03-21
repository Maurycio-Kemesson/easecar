import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/core/widgets/skeleton_loader_custom.dart';
import 'package:easecar/modules/home/data/models/vehicle_model.dart';
import 'package:easecar/modules/home/domain/enuns/vehicle_condition_enum.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:localization/localization.dart';

import '../../../../../../../core/widgets/divider_custom.dart';
import '../../../../../presentation/widgets/story_type_widget.dart';
import 'image_carousel_widget.dart';
import 'list_info_widget.dart';
import 'text_title_widget.dart';
import 'vehicle_info_widget.dart';

class VehicleDetailsWidget extends StatelessWidget {
  final VehicleModel details;
  final PageController pageController;
  final int currentIndex;
  final Function(int) onImageTap;
  final bool isLoading;

  const VehicleDetailsWidget({
    Key? key,
    required this.isLoading,
    required this.details,
    required this.pageController,
    required this.currentIndex,
    required this.onImageTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat.simpleCurrency(locale: 'pt_BR');
    return SingleChildScrollView(
      child: isLoading
          ? const Padding(
              padding: EdgeInsets.only(
                left: AppDimensions.mediumExtra,
                right: AppDimensions.tiny,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: AppDimensions.mediumExtra),
                  SkeletonLoaderCustom(width: double.infinity, height: 170),
                  SizedBox(height: AppDimensions.small),
                  SkeletonLoaderCustom(width: double.infinity, height: 50),
                  SizedBox(height: AppDimensions.mediumExtra),
                  SkeletonLoaderCustom(width: 200, height: 90),
                  SizedBox(height: AppDimensions.large),
                  SkeletonLoaderCustom(width: double.infinity, height: 50),
                  SizedBox(height: AppDimensions.mediumExtra),
                  SkeletonLoaderCustom(width: double.infinity, height: 120),
                ],
              ),
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: AppDimensions.mediumExtra,
                ),
                ImageCarouselWidget(
                  pageController: pageController,
                  currentIndex: currentIndex,
                  onImageTap: onImageTap,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: AppDimensions.mediumExtra,
                    right: AppDimensions.mediumExtra,
                    bottom: AppDimensions.mediumExtra,
                    top: AppDimensions.smallMedium,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        details.model,
                        style: const TextStyle(
                          fontSize: 24,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${details.km}km/${details.condition.value}',
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
                                fontSize: 12,
                                color: AppColors.primaryColor,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.mediumGray,
                              ),
                            ),
                            TextSpan(
                              text: ' ${formatter.format(details.oldValue)}',
                              style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: AppColors.mediumGray,
                                decoration: TextDecoration.lineThrough,
                                decorationColor: AppColors.mediumGray,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        formatter.format(details.newValue),
                        style: const TextStyle(
                          fontSize: 36,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Text(
                        '${details.city}/${details.state}',
                        style: const TextStyle(
                          fontSize: 12,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: AppDimensions.tiny),
                      StoreTypeWidget(
                        type: details.storeType,
                      ),
                      VehicleInfoWidget(
                        vehicleInfo: details,
                      ),
                      const DividerCustom(),
                      TextTitleWidget(
                        title: 'vehicleDetailsItems'.i18n(),
                      ),
                      const SizedBox(height: AppDimensions.medium),
                      ListInfoWidget(
                        items: details.items,
                      ),
                      const SizedBox(height: AppDimensions.large),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          minimumSize: const Size(0, 0),
                          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        ),
                        child: Text(
                          'vehicleDetailsDeleteAd'.i18n(),
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.intenseRedGreen,
                            fontWeight: FontWeight.w600,
                            decoration: TextDecoration.underline,
                            decorationColor: AppColors.intenseRedGreen,
                            height: 2,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
    );
  }
}
