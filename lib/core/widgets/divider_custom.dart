import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

class DividerCustom extends StatelessWidget {
  final double? padding;

  const DividerCustom({super.key, this.padding});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: padding ?? AppDimensions.small),
      child: const Divider(color: AppColors.mediumGray),
    );
  }
}
