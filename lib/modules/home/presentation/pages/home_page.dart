import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

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
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            PageView(
              physics: const NeverScrollableScrollPhysics(),
              controller: pageController,
              children: [
                Container(color: Colors.amber),
                Container(color: Colors.blue),
                Container(color: Colors.green),
                Container(color: Colors.red),
              ],
            ),
          ],
        ),
        bottomNavigationBar: ValueListenableBuilder(
          valueListenable: controller.page,
          builder: (context, page, child) => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              HomeBottomNavigationBar(
                page: page,
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
      ),
    );
  }
}
