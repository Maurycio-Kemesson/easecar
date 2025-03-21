import 'package:easecar/core/widgets/show_snack_bar_custom.dart';
import 'package:easecar/modules/home/data/models/brand_model.dart';
import 'package:flutter/material.dart';
import 'package:localization/localization.dart';

import '../../../../data/models/feedback_model.dart';
import '../../../../data/models/story_profile_model.dart';
import '../../../../data/models/vehicle_model.dart';
import '../../../../domain/enuns/store_type_enum.dart';
import '../../../../domain/enuns/vehicle_condition_enum.dart';
import '../../../../domain/enuns/vehicle_status_enum.dart';
import '../../../../domain/usecases/fetch_feedbacks_usecase.dart';
import '../../../../domain/usecases/fetch_vehicle_details_usecase.dart';

abstract class VehicleDetailsController extends ChangeNotifier {
  loadDependences(BuildContext context, String id);
  ValueNotifier<bool> get isDetailsLoading;
  ValueNotifier<VehicleModel> get details;
  ValueNotifier<int> get currentImageIndex;
  void clickImage(int index);
  ValueNotifier<List<FeedbackModel>> get feedbacks;
  ValueNotifier<bool> get isFeedbacksLoading;
  ValueNotifier<StoryProfileModel> get story;
}

class VehicleDetailsControllerImp extends VehicleDetailsController {
  FetchVehicleDetailsUsecase fetchVehicleDetailsUsecase;
  FetchFeedbacksUsecase fetchFeedbacksUsecase;

  VehicleDetailsControllerImp({
    required this.fetchVehicleDetailsUsecase,
    required this.fetchFeedbacksUsecase,
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
  ValueNotifier<List<FeedbackModel>> feedbacks = ValueNotifier([]);

  @override
  ValueNotifier<bool> isFeedbacksLoading = ValueNotifier(false);

  @override
  ValueNotifier<StoryProfileModel> story = ValueNotifier(
    StoryProfileModel(
      imageUrl: '',
      location: '',
      name: '',
      ratingStars: 0,
      reviewCount: 0,
      type: StoreTypeEnum.dealership,
    ),
  );

  @override
  loadDependences(BuildContext context, String id) {
    fetchVehicleDetails(context, id);
    fetchFeedbacks(context);
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

  Future<void> fetchFeedbacks(BuildContext context) async {
    isFeedbacksLoading.value = true;
    var response = await fetchFeedbacksUsecase();
    response.fold(
      (err) {
        showSnackBarCustom(
            context, 'vehicleDetailsErrorLoadingFeedbacksMessage'.i18n());
        isFeedbacksLoading.value = false;
      },
      (data) {
        feedbacks.value = data;
        story.value = StoryProfileModel(
          imageUrl: 'https://www.w3schools.com/w3images/fjords.jpg',
          name: 'Business Car',
          location: 'Fortaleza/CE',
          ratingStars: 4,
          reviewCount: 40,
          type: StoreTypeEnum.dealership,
        );
        isFeedbacksLoading.value = false;
      },
    );
  }
}
