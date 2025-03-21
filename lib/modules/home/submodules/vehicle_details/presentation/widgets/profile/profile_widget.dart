import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/core/widgets/text_button_custom.dart';
import 'package:easecar/modules/home/data/models/feedback_model.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../../../../core/widgets/skeleton_loader_custom.dart';
import '../../../../../data/models/story_profile_model.dart';
import 'feedback_widget.dart';
import 'header_widget.dart';

class ProfileWidget extends StatelessWidget {
  final StoryProfileModel story;
  final List<FeedbackModel> feedbacks;
  final Function()? onMyAdsPressed;
  final Function()? onSeeMorePressed;
  final bool isLoading;

  const ProfileWidget({
    Key? key,
    required this.story,
    required this.feedbacks,
    required this.onMyAdsPressed,
    required this.onSeeMorePressed,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppDimensions.mediumExtra),
      child: isLoading
          ? const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: AppDimensions.mediumExtra),
                SkeletonLoaderCustom(width: 88, height: 88),
                SizedBox(height: AppDimensions.small),
                SkeletonLoaderCustom(width: 200, height: 20),
                SizedBox(height: AppDimensions.small),
                SkeletonLoaderCustom(width: 180, height: 20),
                SizedBox(height: AppDimensions.small),
                SkeletonLoaderCustom(width: 190, height: 20),
                SizedBox(height: AppDimensions.mediumExtra),
                SkeletonLoaderCustom(width: 200, height: 50),
                SizedBox(height: AppDimensions.large),
                SkeletonLoaderCustom(width: double.infinity, height: 20),
                SizedBox(height: AppDimensions.mediumExtra),
                SkeletonLoaderCustom(width: double.infinity, height: 50),
                SizedBox(height: AppDimensions.smallMedium),
                SkeletonLoaderCustom(width: double.infinity, height: 50),
                SizedBox(height: AppDimensions.smallMedium),
                SkeletonLoaderCustom(width: double.infinity, height: 50),
                SizedBox(height: AppDimensions.smallMedium),
                SkeletonLoaderCustom(width: double.infinity, height: 50),
              ],
            )
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderWidget(
                  story: story,
                  onMyAdsPressed: onMyAdsPressed,
                ),
                const SizedBox(height: AppDimensions.large),
                Text(
                  'vehicleDetailsMyAds'.i18n(),
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(
                  children: feedbacks
                      .map((element) => FeedbackWidget(feedback: element))
                      .toList(),
                ),
                const SizedBox(height: AppDimensions.small),
                Center(
                  child: TextButtonCustom(
                    onPressed: onSeeMorePressed,
                    title: 'homeSeeDetails'.i18n(),
                    styleText: const TextStyle(
                      fontSize: 16,
                      color: AppColors.primaryColor,
                      fontWeight: FontWeight.w600,
                      decoration: TextDecoration.underline,
                      decorationColor: AppColors.primaryColor,
                      height: 2,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
