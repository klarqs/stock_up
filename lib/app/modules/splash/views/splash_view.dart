import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../controllers/splash_controller.dart';
import 'mobile/splash_mobile_portrait.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => SplashMobilePortrait(),
        landscape: (_) =>
            SplashMobilePortrait(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            SplashMobilePortrait(), // replace with portrait view for tablet
        landscape: (_) =>
            SplashMobilePortrait(), // replace with landscape view for tablet
      ),
    );
  }
}
