import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/stock_details_app_bar.dart';
import '../widgets/stock_details_home_body/stock_details_body.dart';

class StockDetailsMobilePortraitView extends StatelessWidget {
  final String name, symbol;
  StockDetailsMobilePortraitView(
      {Key? key, required this.name, required this.symbol})
      : super(key: key);

  final StockDetailsAppBar _appBar = Get.put(StockDetailsAppBar());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar.stockDetailsAppBar(name: name, symbol: symbol),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              StockDetailsBody(symbol: symbol, name: name),
            ],
          ),
        ),
      ),
    );
  }
}
