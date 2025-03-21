import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';

import '../../domain/enuns/store_type_enum.dart';

class StoreTypeWidget extends StatelessWidget {
  final StoreTypeEnum type;
  final Color? color;

  const StoreTypeWidget({
    Key? key,
    required this.type,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ?? AppColors.brightBlue,
        borderRadius: BorderRadius.circular(3.0),
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.tinyExtra,
        vertical: AppDimensions.line,
      ),
      child: Text(
        type.value,
        style: const TextStyle(
          fontSize: 7,
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
