import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../widgets/stocks_home_app_bar.dart';
import '../widgets/stocks_home_body/stocks_home_body.dart';

class StocksHomeMobilePortraitView extends StatelessWidget {
  StocksHomeMobilePortraitView({Key? key}) : super(key: key);
  final StocksHomeAppBar _appBar = Get.put(StocksHomeAppBar());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar.stocksHomeAppBar(context: context),
      backgroundColor: const Color(0xff121212),
      body: SafeArea(
        child: Column(
          children: [
            StocksHomeBody(),
          ],
        ),
      ),
    );
  }
}
