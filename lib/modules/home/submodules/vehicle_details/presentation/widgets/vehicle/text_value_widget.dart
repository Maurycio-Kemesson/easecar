import 'package:easecar/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextValueWidget extends StatelessWidget {
  final String value;

  const TextValueWidget({
    Key? key,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      value,
      style: const TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: AppColors.secondaryColor,
      ),
    );
  }
}
