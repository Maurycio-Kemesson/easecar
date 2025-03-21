import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/conts/icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:localization/localization.dart';

import '../controllers/vehicle_details_controller.dart';
import '../widgets/about/about_widget.dart';
import '../widgets/vehicle/vehicle_details_widget.dart';

class VehicleDetailsPage extends StatefulWidget {
  final String id;

  const VehicleDetailsPage({super.key, required this.id});

  @override
  State<VehicleDetailsPage> createState() => _VehicleDetailsPageState();
}

class _VehicleDetailsPageState extends State<VehicleDetailsPage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final controller = Modular.get<VehicleDetailsController>();

  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.loadDependences(context, widget.id);
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        controller.isDetailsLoading,
        controller.details,
        controller.currentImageIndex,
      ]),
      builder: (context, child) {
        return SafeArea(
          child: Scaffold(
            backgroundColor: AppColors.white,
            appBar: AppBar(
              title: Text(
                'vehicleDetails'.i18n(),
                style: TextStyleCustom.titleAppBar,
              ),
              centerTitle: true,
              backgroundColor: AppColors.white,
              leading: IconButton(
                icon: SvgPicture.asset(AppIcons.arrowBack),
                onPressed: () => Modular.to.pop(),
              ),
              actions: [
                Visibility(
                  visible: _tabController.index == 0,
                  child: IconButton(
                    icon: SvgPicture.asset(AppIcons.edit),
                    onPressed: () {},
                  ),
                ),
                IconButton(
                  icon: SvgPicture.asset(AppIcons.share),
                  onPressed: () {},
                ),
              ],
              bottom: TabBar(
                controller: _tabController,
                labelStyle: TextStyleCustom.titleDefault.copyWith(
                  fontSize: 10,
                  color: AppColors.primaryColor,
                ),
                unselectedLabelColor: AppColors.textActivity,
                dividerColor: Colors.transparent,
                indicator: const UnderlineTabIndicator(
                  borderSide: BorderSide(
                    color: AppColors.primaryColor,
                    width: 3.0,
                  ),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(text: 'vehicleDetailsVehicle'.i18n()),
                  Tab(text: 'vehicleDetailsProfile'.i18n()),
                  Tab(text: 'vehicleDetailsAbout'.i18n()),
                ],
              ),
            ),
            body: TabBarView(
              controller: _tabController,
              children: [
                VehicleDetailsWidget(
                  currentIndex: controller.currentImageIndex.value,
                  details: controller.details.value,
                  onImageTap: controller.clickImage,
                  pageController: _pageController,
                  isLoading: controller.isDetailsLoading.value,
                ),
                AboutWidget(
                  about: controller.details.value.about,
                  isLoading: controller.isDetailsLoading.value,
                  onEditPressed: () {},
                ),
                AboutWidget(
                  about: controller.details.value.about,
                  isLoading: controller.isDetailsLoading.value,
                  onEditPressed: () {},
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
