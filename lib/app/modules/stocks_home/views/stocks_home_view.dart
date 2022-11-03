import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'mobile/stocks_home_mobile_portrait_view.dart';

class StocksHomeView extends GetResponsiveView {
  StocksHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => StocksHomeMobilePortraitView(),
        landscape: (_) =>
            StocksHomeMobilePortraitView(), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) =>
            StocksHomeMobilePortraitView(), // replace with portrait view for tablet
        landscape: (_) =>
            StocksHomeMobilePortraitView(), // replace with landscape view for tablet
      ),
    );
  }
}
