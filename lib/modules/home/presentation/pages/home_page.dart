import 'package:easecar/app/app_routes.dart';
import 'package:easecar/app/theme/app_colors.dart';
import 'package:easecar/app/theme/app_dimensions.dart';
import 'package:easecar/app/theme/text_style_custom.dart';
import 'package:easecar/core/widgets/skeleton_loader_custom.dart';
import 'package:easecar/modules/home/data/models/vehicle_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:localization/localization.dart';

import '../controllers/home_controller.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/brand_card_widget.dart';
import '../widgets/home_bottom_navigation_bar.dart';
import '../widgets/vehicle_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with WidgetsBindingObserver, SingleTickerProviderStateMixin {
  final controller = Modular.get<HomeController>();
  final pageController = PageController();

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    WidgetsBinding.instance.addPostFrameCallback(
      (_) {
        controller.loadDependences(
          context,
          pageIndex: 0,
          pageController: pageController,
        );
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
        controller.page,
        controller.searchController,
        controller.isBrandsLoading,
        controller.brands,
        controller.isNewVehiclesLoading,
        controller.newVehicles,
        controller.newVehiclesCopy,
        controller.isUsedVehiclesLoading,
        controller.usedVehicles,
        controller.usedVehiclesCopy,
        controller.selectedBrand,
      ]),
      builder: (context, child) {
        return PopScope(
          canPop: false,
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: AppColors.white,
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
    return Container(
      color: AppColors.white,
      child: Column(
        children: [
          AppBarWidget(
            searchController: controller.searchController,
            onChanged: controller.onSearchChanged,
          ),
          Expanded(
            child: Column(
              spacing: AppDimensions.mediumExtra,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TabBar(
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
                    Tab(text: 'homeNewCars'.i18n()),
                    Tab(text: 'homePreOwnedCars'.i18n()),
                  ],
                ),
                Expanded(
                  child: TabBarView(
                    controller: _tabController,
                    children: [
                      _makeTabCars(
                        isLoading: controller.isNewVehiclesLoading.value,
                        list: controller.newVehicles.value,
                      ),
                      _makeTabCars(
                        isLoading: controller.isUsedVehiclesLoading.value,
                        list: controller.usedVehicles.value,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _makeTabCars({
    required bool isLoading,
    required List<VehicleModel> list,
  }) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: AppDimensions.mediumExtra,
              top: AppDimensions.tiny,
              bottom: AppDimensions.tiny,
            ),
            child: Column(
              spacing: AppDimensions.tinyExtra,
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'homeBrands'.i18n(),
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.secondaryColor,
                  ),
                ),
                SizedBox(
                  height: 64.0,
                  child: controller.isBrandsLoading.value
                      ? ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          itemBuilder: (context, index) {
                            return const SkeletonLoaderCustom(
                              height: 60,
                              width: 60,
                            );
                          },
                        )
                      : ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: controller.brands.value.length,
                          itemBuilder: (context, index) {
                            var brand = controller.brands.value[index];
                            return BrandCardWidget(
                              name: brand.name,
                              icon: brand.image,
                              selected: controller.selectedBrand.value == brand,
                              onTap: () => controller.applyBrandFilter(brand),
                            );
                          },
                        ),
                ),
              ],
            ),
          ),
          SizedBox(
            child: isLoading
                ? Column(
                    children: List.generate(
                      4,
                      (index) => const Padding(
                        padding: EdgeInsets.only(
                          left: AppDimensions.mediumExtra,
                          top: AppDimensions.mediumExtra,
                          bottom: AppDimensions.tiny,
                        ),
                        child: SkeletonLoaderCustom(
                          height: 180,
                          width: double.infinity,
                        ),
                      ),
                    ),
                  )
                : Column(
                    children: list.isEmpty ||
                            (controller.selectedBrand.value != null &&
                                list
                                    .where((vehicle) =>
                                        vehicle.brand.name
                                            .trim()
                                            .toLowerCase() ==
                                        controller.selectedBrand.value?.name
                                            .trim()
                                            .toLowerCase())
                                    .isEmpty)
                        ? [
                            Container(
                              height: MediaQuery.of(context).size.height / 2,
                              padding: const EdgeInsets.symmetric(
                                horizontal: AppDimensions.mediumExtra,
                              ),
                              child: Center(
                                child: Text(
                                  'homeErrorNoVehiclesForBrandMessage'.i18n(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: AppColors.primaryColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ]
                        : list
                            .where((vehicle) =>
                                controller.selectedBrand.value == null ||
                                vehicle.brand.name.trim().toLowerCase() ==
                                    controller.selectedBrand.value?.name
                                        .trim()
                                        .toLowerCase())
                            .map(
                              (vehicle) => VehicleCardWidget(
                                vehicle: vehicle,
                                onDetailsPressed: () => Modular.to.pushNamed(
                                  AppRoutes.details,
                                  arguments: vehicle.id,
                                ),
                              ),
                            )
                            .toList(),
                  ),
          ),
        ],
      ),
    );
  }
}
