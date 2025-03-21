import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../../../../data/models/feedback_model.dart';

class FeedbackWidget extends StatelessWidget {
  final FeedbackModel feedback;

  const FeedbackWidget({Key? key, required this.feedback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: AppDimensions.smallMedium),
      padding: const EdgeInsets.all(AppDimensions.smallMedium),
      decoration: BoxDecoration(
        color: AppColors.softBlush,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        spacing: AppDimensions.small,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.primaryColor, width: 1),
            ),
            child: ClipOval(
              child: Image.network(
                feedback.clientPhoto,
                width: 40,
                height: 40,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.person,
                  size: 40,
                  color: Colors.grey,
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  feedback.clientName,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.steelBlue,
                  ),
                ),
                Text(
                  feedback.comment,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w400,
                    color: AppColors.slateGray,
                  ),
                ),
              ],
            ),
          ),
          Row(
            children: [
              Text(
                feedback.rating.toStringAsFixed(1),
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: AppColors.steelBlue,
                ),
              ),
              const Icon(Icons.star, color: AppColors.lightGold, size: 16),
            ],
          ),
        ],
      ),
    );
  }
}
