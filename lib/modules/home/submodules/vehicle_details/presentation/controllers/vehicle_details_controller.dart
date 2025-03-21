import 'package:easecar/core/widgets/show_snack_bar_custom.dart';
import 'package:easecar/modules/home/data/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../data/models/vehicle_model.dart';
import '../../../../domain/enuns/store_type_enum.dart';
import '../../../../domain/enuns/vehicle_condition_enum.dart';
import '../../../../domain/enuns/vehicle_status_enum.dart';
import '../../../../domain/usecases/fetch_vehicle_details_usecase.dart';

abstract class VehicleDetailsController extends ChangeNotifier {
  loadDependences(BuildContext context, String id);
  ValueNotifier<bool> get isDetailsLoading;
  ValueNotifier<VehicleModel> get details;
  ValueNotifier<int> get currentImageIndex;
  void clickImage(int index);
}

class VehicleDetailsControllerImp extends VehicleDetailsController {
  FetchVehicleDetailsUsecase fetchVehicleDetailsUsecase;

  VehicleDetailsControllerImp({
    required this.fetchVehicleDetailsUsecase,
  });

  @override
  ValueNotifier<bool> isDetailsLoading = ValueNotifier(false);

  @override
  ValueNotifier<VehicleModel> details = ValueNotifier(
    VehicleModel(
      id: '',
      model: '',
      km: 0,
      color: '',
      oldValue: 0,
      newValue: 0,
      city: '',
      state: '',
      storeType: StoreTypeEnum.dealership,
      status: VehicleStatusEnum.approved,
      condition: VehicleConditionEnum.usedVehicle,
      brand: BrandModel(name: '', image: ''),
      year: 0,
      gearbox: '',
      doors: 0,
      fuel: '',
      armored: false,
      items: [],
      about: '',
    ),
  );

  @override
  ValueNotifier<int> currentImageIndex = ValueNotifier(0);

  @override
  loadDependences(BuildContext context, String id) {
    fetchVehicleDetails(context, id);
  }

  Future<void> fetchVehicleDetails(BuildContext context, String id) async {
    isDetailsLoading.value = true;
    var response = await fetchVehicleDetailsUsecase(id);
    response.fold(
      (err) {
        showSnackBarCustom(context, 'homeErrorLoadingDetailsMessage'.i18n());
        isDetailsLoading.value = false;
      },
      (data) {
        details.value = data;
        isDetailsLoading.value = false;
      },
    );
  }

  @override
  void clickImage(int index) => currentImageIndex.value = index;
}
