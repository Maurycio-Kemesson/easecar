import 'package:easecar/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextTitleWidget extends StatelessWidget {
  final String title;

  const TextTitleWidget({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 10,
        color: AppColors.textActivity,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}
