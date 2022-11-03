import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_responsive.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'mobile/stock_details_mobile_portrait_view.dart';

class StockDetailsView extends GetResponsiveView {
  final String name, symbol;
  StockDetailsView(this.name, this.symbol, {super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (_) => OrientationLayoutBuilder(
        portrait: (_) => StockDetailsMobilePortraitView(
          name: name,
          symbol: symbol,
        ),
        landscape: (_) => StockDetailsMobilePortraitView(
          name: name,
          symbol: symbol,
        ), // replace with landscape view for mobile
      ),
      tablet: (_) => OrientationLayoutBuilder(
        portrait: (_) => StockDetailsMobilePortraitView(
          name: name,
          symbol: symbol,
        ), // replace with portrait view for tablet
        landscape: (_) => StockDetailsMobilePortraitView(
          name: name,
          symbol: symbol,
        ), // replace with landscape view for tablet
      ),
    );
  }
}
