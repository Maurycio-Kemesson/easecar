import 'package:easecar/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LinearProgressIndicatorCustom extends StatelessWidget {
  const LinearProgressIndicatorCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return const LinearProgressIndicator(
      color: AppColors.secondaryColor,
      backgroundColor: AppColors.white,
    );
  }
}
