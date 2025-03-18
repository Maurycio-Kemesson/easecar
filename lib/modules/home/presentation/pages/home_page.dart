import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:localization/localization.dart';

import '../controllers/home_controller.dart';
import '../widgets/home_bottom_navigation_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with WidgetsBindingObserver {
  final controller = Modular.get<HomeController>();
  final pageController = PageController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.loadDependences(
          pageIndex: 0,
          pageController: pageController,
        );
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        controller.page,
        controller.searchController,
      ]),
      builder: (context, child) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            body: Stack(
              children: [
                PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: pageController,
                  children: [
                    _makeHome(),
                    Container(color: Colors.blue),
                    Container(color: Colors.green),
                    Container(color: Colors.red),
                  ],
                ),
              ],
            ),
            bottomNavigationBar: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                HomeBottomNavigationBar(
                  page: controller.page.value,
                  onTap: (value) async {
                    controller.changePage(
                      pageIndex: value,
                      pageController: pageController,
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _makeHome() {
    return Column(
      children: [
        _makeAppBar(),
        Expanded(child: Container(color: Colors.white)),
      ],
    );
  }

  Widget _makeAppBar() {
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
                  controller: controller.searchController,
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
