import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class AppBarWidget extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String)? onChanged;

  const AppBarWidget({
    Key? key,
    required this.searchController,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: AppColors.lightGray,
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.large,
          vertical: AppDimensions.small,
        ),
        height: 65.0,
        child: Row(
          spacing: AppDimensions.smallMedium,
          children: [
            Flexible(
              child: SizedBox(
                height: 40.0,
                child: TextField(
                  controller: searchController,
                  onChanged: onChanged,
                  textAlignVertical: TextAlignVertical.top,
                  cursorColor: AppColors.primaryColor,
                  cursorHeight: AppDimensions.medium,
                  cursorWidth: 1.5,
                  style: TextStyleCustom.titleDefault.copyWith(
                    color: AppColors.primaryColor,
                    fontSize: 11,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'homeSeach'.i18n(),
                    isDense: true,
                    hintStyle: TextStyleCustom.titleDefault.copyWith(
                      color: AppColors.softGray,
                      fontSize: 11,
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(
                        top: 10.0,
                        bottom: 10.0,
                        left: AppDimensions.mediumExtra,
                        right: AppDimensions.smallExtra,
                      ),
                      child: SvgPicture.asset(
                        AppIcons.search,
                        width: 20.0,
                        height: 20.0,
                      ),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.large,
                      vertical: AppDimensions.smallMedium,
                    ),
                    border: border,
                    enabledBorder: border,
                    focusedBorder: border,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(AppIcons.notification),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(AppIcons.drawer),
            ),
          ],
        ),
      ),
    );
  }

  OutlineInputBorder get border => OutlineInputBorder(
        borderRadius: BorderRadius.circular(30.0),
        borderSide: const BorderSide(
          color: AppColors.softGray,
          width: 0.3,
        ),
      );
}
