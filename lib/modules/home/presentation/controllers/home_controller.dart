import 'dart:async';

import 'package:easecar/core/widgets/show_snack_bar_custom.dart';
import 'package:easecar/modules/home/data/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../data/models/vehicle_model.dart';
import '../../domain/usecases/fetch_brands_usecase.dart';
import '../../domain/usecases/fetch_new_vehicles_usecase.dart';
import '../../domain/usecases/fetch_used_vehicles_usecase.dart';

abstract class HomeController extends ChangeNotifier {
  ValueNotifier<int> get page;
  TextEditingController get searchController;
  ValueNotifier<bool> get isBrandsLoading;
  ValueNotifier<List<BrandModel>> get brands;
  ValueNotifier<bool> get isNewVehiclesLoading;
  ValueNotifier<List<VehicleModel>> get newVehicles;
  ValueNotifier<List<VehicleModel>> get newVehiclesCopy;
  ValueNotifier<bool> get isUsedVehiclesLoading;
  ValueNotifier<List<VehicleModel>> get usedVehicles;
  ValueNotifier<List<VehicleModel>> get usedVehiclesCopy;
  ValueNotifier<BrandModel?> get selectedBrand;
  loadDependences(
    BuildContext context, {
    required int pageIndex,
    required PageController pageController,
  });
  void changePage({
    required int pageIndex,
    required PageController? pageController,
  });
  void applyBrandFilter(BrandModel brand);
  void onSearchChanged(String query);
}

class HomeControllerImp extends HomeController {
  FetchBrandsUsecase fetchBrandsUsecase;
  FetchNewVehiclesUsecase fetchNewVehiclesUsecase;
  FetchUsedVehiclesUsecase fetchUsedVehiclesUsecase;

  HomeControllerImp({
    required this.fetchBrandsUsecase,
    required this.fetchNewVehiclesUsecase,
    required this.fetchUsedVehiclesUsecase,
  });

  late PageController _pageController;

  @override
  ValueNotifier<int> page = ValueNotifier(0);

  @override
  TextEditingController searchController = TextEditingController();

  @override
  ValueNotifier<bool> isBrandsLoading = ValueNotifier(true);

  @override
  ValueNotifier<List<BrandModel>> brands = ValueNotifier([]);

  @override
  ValueNotifier<bool> isNewVehiclesLoading = ValueNotifier(true);

  @override
  ValueNotifier<List<VehicleModel>> newVehicles = ValueNotifier([]);
  @override
  ValueNotifier<List<VehicleModel>> newVehiclesCopy = ValueNotifier([]);

  @override
  ValueNotifier<bool> isUsedVehiclesLoading = ValueNotifier(true);

  @override
  ValueNotifier<List<VehicleModel>> usedVehicles = ValueNotifier([]);
  @override
  ValueNotifier<List<VehicleModel>> usedVehiclesCopy = ValueNotifier([]);

  @override
  ValueNotifier<BrandModel?> selectedBrand = ValueNotifier(null);

  Timer? _debounce;

  @override
  loadDependences(
    BuildContext context, {
    required int pageIndex,
    required PageController pageController,
  }) {
    changePage(
      pageIndex: pageIndex,
      pageController: pageController,
    );
    fetchBrands(context);
    fetchNewVehicles(context);
    fetchUsedVehicles(context);
  }

  @override
  void changePage({
    required int pageIndex,
    required PageController? pageController,
  }) {
    if (pageController != null) {
      _pageController = pageController;
    }
    page.value = pageIndex;
    if (_pageController.hasClients) {
      Future.delayed(
        const Duration(microseconds: 10),
        () => _pageController.jumpToPage(pageIndex),
      );
    }
  }

  Future<void> fetchBrands(BuildContext context) async {
    isBrandsLoading.value = true;
    var response = await fetchBrandsUsecase();
    response.fold(
      (err) {
        showSnackBarCustom(context, 'homeErrorLoadingBrandsMessage'.i18n());
        isBrandsLoading.value = false;
      },
      (data) {
        brands.value = data
          ..sort(
            (a, b) => a.name.toLowerCase().compareTo(b.name.toLowerCase()),
          );
        isBrandsLoading.value = false;
      },
    );
  }

  Future<void> fetchNewVehicles(BuildContext context) async {
    isNewVehiclesLoading.value = true;
    var response = await fetchNewVehiclesUsecase();
    response.fold(
      (err) {
        showSnackBarCustom(context, 'homeErrorLoadingVehiclesMessage'.i18n());
        isNewVehiclesLoading.value = false;
      },
      (data) {
        newVehicles.value = data
          ..sort(
            (a, b) => a.model.toLowerCase().compareTo(b.model.toLowerCase()),
          );
        newVehiclesCopy.value = List.from(newVehicles.value);
        isNewVehiclesLoading.value = false;
      },
    );
  }

  Future<void> fetchUsedVehicles(BuildContext context) async {
    isUsedVehiclesLoading.value = true;
    var response = await fetchUsedVehiclesUsecase();
    response.fold(
      (err) {
        showSnackBarCustom(context, 'homeErrorLoadingVehiclesMessage'.i18n());
        isUsedVehiclesLoading.value = false;
      },
      (data) {
        usedVehicles.value = data
          ..sort(
            (a, b) => a.model.toLowerCase().compareTo(b.model.toLowerCase()),
          );
        usedVehiclesCopy.value = List.from(usedVehicles.value);
        isUsedVehiclesLoading.value = false;
      },
    );
  }

  @override
  void applyBrandFilter(BrandModel brand) {
    if (selectedBrand.value == brand) {
      selectedBrand.value = null;
    } else {
      selectedBrand.value = brand;
    }
  }

  @override
  void onSearchChanged(String query) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 300), () {
      if (query.isEmpty) {
        newVehicles.value = List.from(newVehiclesCopy.value);
        usedVehicles.value = List.from(usedVehiclesCopy.value);
      } else {
        final filteredListNew = newVehiclesCopy.value
            .where((vehicle) =>
                vehicle.model.toLowerCase().contains(query.toLowerCase()))
            .toList();
        final filteredListUsed = usedVehiclesCopy.value
            .where((vehicle) =>
                vehicle.model.toLowerCase().contains(query.toLowerCase()))
            .toList();
        if (newVehicles.value != filteredListNew) {
          newVehicles.value = filteredListNew;
        }
        if (usedVehicles.value != filteredListUsed) {
          usedVehicles.value = filteredListUsed;
        }
      }
    });
  }
}
