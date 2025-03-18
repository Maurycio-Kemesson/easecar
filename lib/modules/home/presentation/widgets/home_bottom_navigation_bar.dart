import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

class HomeBottomNavigationBar extends StatefulWidget {
  final int page;
  final Function(int value) onTap;

  const HomeBottomNavigationBar({
    super.key,
    required this.page,
    required this.onTap,
  });

  @override
  State<HomeBottomNavigationBar> createState() =>
      _HomeBottomNavigationBarState();
}

class _HomeBottomNavigationBarState extends State<HomeBottomNavigationBar> {
  int total = 4;

  double pageWidth(BuildContext context) => MediaQuery.sizeOf(context).width;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(10.0),
        topRight: Radius.circular(10.0),
      ),
      child: Container(
        height: AppDimensions.huge + AppDimensions.small,
        color: AppColors.primaryColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(total, (index) {
            return _buildNavItem(index);
          }),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index) {
    bool isSelected = widget.page == index;
    return InkWell(
      onTap: () => widget.onTap(index),
      child: Container(
        padding: EdgeInsets.all(
          index == 1 || index == 2 ? AppDimensions.medium : AppDimensions.mediumExtra,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.tertiaryColor : Colors.transparent,
          shape: BoxShape.circle,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: AppDimensions.tiny,
          children: [
            SvgPicture.asset(
              _getIconPath(index),
              width: 18.0,
              height: 18.0,
              colorFilter: ColorFilter.mode(
                isSelected ? Colors.white : AppColors.white,
                BlendMode.srcIn,
              ),
            ),
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                _getLabel(index),
                style: TextStyleCustom.titleNavigation,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getIconPath(int index) {
    switch (index) {
      case 0:
        return AppIcons.home;
      case 1:
        return AppIcons.advertise;
      case 2:
        return AppIcons.message;
      case 3:
        return AppIcons.profile;
      default:
        return AppIcons.home;
    }
  }

  String _getLabel(int index) {
    switch (index) {
      case 0:
        return 'bottomNavigationBarHome'.i18n();
      case 1:
        return 'bottomNavigationBarAdvertise'.i18n();
      case 2:
        return 'bottomNavigationBarMessage'.i18n();
      case 3:
        return 'bottomNavigationBarProfile'.i18n();
      default:
        return '';
    }
  }
}
