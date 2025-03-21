import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/core/widgets/skeleton_loader_custom.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

class AboutWidget extends StatelessWidget {
  final String about;
  final Function()? onEditPressed;
  final bool isLoading;

  const AboutWidget({
    Key? key,
    required this.about,
    required this.onEditPressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height / 2.5;
    return isLoading
        ? SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height,
                  padding: const EdgeInsets.only(
                    left: AppDimensions.medium,
                    top: AppDimensions.medium,
                    bottom: AppDimensions.medium,
                  ),
                  child: SkeletonLoaderCustom(
                    width: double.infinity,
                    height: height,
                  ),
                ),
              ],
            ),
          )
        : Padding(
            padding: const EdgeInsets.all(AppDimensions.mediumExtra),
            child: Column(
              spacing: AppDimensions.large,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  about,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: AppColors.textActivity,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: onEditPressed,
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: const Size(0, 0),
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                  child: Text(
                    'vehicleDetailsEdit'.i18n(),
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.secondaryColor,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.secondaryColor,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
