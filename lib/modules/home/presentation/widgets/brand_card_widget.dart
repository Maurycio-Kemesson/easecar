import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

class BrandCardWidget extends StatelessWidget {
  final Function()? onTap;
  final String icon;
  final String name;
  final bool selected;

  const BrandCardWidget({
    Key? key,
    required this.onTap,
    required this.icon,
    required this.name,
    required this.selected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 64.0,
        height: 60.0,
        margin: const EdgeInsets.only(right: AppDimensions.smallMedium),
        decoration: BoxDecoration(
          color: selected ? AppColors.darkerSoftBlue : AppColors.softBlue,
          borderRadius: BorderRadius.circular(4.0),
        ),
        padding: const EdgeInsets.all(AppDimensions.small),
        child: Column(
          spacing: AppDimensions.lineExtra,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              child: SvgPicture.asset(icon, fit: BoxFit.contain),
            ),
            Text(
              name.i18n(),
              style: const TextStyle(
                fontSize: 8,
                fontWeight: FontWeight.w600,
                color: AppColors.secondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
