import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

import '../../../../../data/models/story_profile_model.dart';
import '../../../../../presentation/widgets/story_type_widget.dart';
import 'star_rating_widget.dart';

class HeaderWidget extends StatelessWidget {
  final StoryProfileModel story;
  final Function()? onMyAdsPressed;

  const HeaderWidget({
    Key? key,
    required this.story,
    required this.onMyAdsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 88,
            height: 88,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 4),
            ),
            child: ClipOval(
              child: Image.network(
                story.imageUrl,
                width: 88,
                height: 88,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: AppColors.softBlush,
                ),
              ),
            ),
          ),
          const SizedBox(height: AppDimensions.small),
          StoreTypeWidget(
            type: story.type,
            color: AppColors.deepNavyBlue,
          ),
          const SizedBox(height: AppDimensions.tinyExtra),
          Text(
            story.name,
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.w600,
            ),
          ),
          Center(
            child: Row(
              spacing: AppDimensions.tiny,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(AppIcons.location),
                Text(
                  story.location,
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.secondaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: AppDimensions.small),
          StarRatingWidget(rating: story.ratingStars),
          const SizedBox(height: AppDimensions.small),
          Text(
            'vehicleDetailsAds'.i18n([story.reviewCount.toString()]),
            style: const TextStyle(
              fontSize: 16,
              color: AppColors.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: AppDimensions.small),
          ElevatedButton(
            onPressed: onMyAdsPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(
                vertical: AppDimensions.small,
                horizontal: AppDimensions.large,
              ),
              elevation: 0,
            ),
            child: Row(
              spacing: AppDimensions.smallMedium,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'vehicleDetailsMyAds'.i18n(),
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.white,
                  size: 14,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
