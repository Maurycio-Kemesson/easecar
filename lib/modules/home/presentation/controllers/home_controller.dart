import 'package:flutter/material.dart';

abstract class HomeController extends ChangeNotifier {
  ValueNotifier<int> get page;
  loadDependences({
    required int pageIndex,
    required PageController pageController,
  });
  void changePage({
    required int pageIndex,
    required PageController? pageController,
  });
}

class HomeControllerImp extends HomeController {
  late PageController _pageController;

  @override
  ValueNotifier<int> page = ValueNotifier(0);

  @override
  loadDependences({
    required int pageIndex,
    required PageController pageController,
  }) {
    changePage(
      pageIndex: pageIndex,
      pageController: pageController,
    );
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
}
