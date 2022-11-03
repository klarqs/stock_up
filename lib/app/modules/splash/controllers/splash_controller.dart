import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_report/app/modules/stocks_home/views/stocks_home_view.dart';

class SplashController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final fadeInDuration = Duration(milliseconds: 1500);
  late AnimationController opacityCtrl;
  late Animation<double> designOpacity, logoOpacity;

  late bool isFirstLaunch;
  late bool isLoggedIn;

  @override
  void onInit() {
    initAnimationController();
    initOpacityAnimation();
    runAnimation();
    moveToNextPage();
    super.onInit();
  }

  @override
  void onClose() {
    opacityCtrl.dispose();
  }

  void moveToNextPage() async {
    await Future.delayed(const Duration(milliseconds: 4000));

    return Get.off(
      () => StocksHomeView(),
      transition: Transition.fadeIn,
    );
  }

  void initAnimationController() {
    opacityCtrl = AnimationController(
      vsync: this,
      duration: fadeInDuration,
      reverseDuration: const Duration(milliseconds: 500),
    );
  }

  void initOpacityAnimation() {
    logoOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: opacityCtrl, curve: Interval(0, 1)),
    );
    designOpacity = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: opacityCtrl, curve: Interval(0.5, 1)),
    );
  }

  void runAnimation() async {
    opacityCtrl.forward();
    await Future.delayed(Duration(milliseconds: 3500));
    opacityCtrl.reverse();
  }
}
