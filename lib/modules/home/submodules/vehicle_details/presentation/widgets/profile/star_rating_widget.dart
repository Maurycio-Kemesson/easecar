import 'package:easecar/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class StarRatingWidget extends StatelessWidget {
  final int rating;
  final int maxRating = 5;

  const StarRatingWidget({super.key, required this.rating});

  @override
  Widget build(BuildContext context) {
    List<Widget> stars = [];

    for (int i = 0; i < maxRating; i++) {
      stars.add(
        Icon(
          Icons.star,
          color: i < rating ? AppColors.lightGold : Colors.grey[200],
          size: 22,
        ),
      );
    }

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: stars,
      ),
    );
  }
}
