import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_report/app/modules/stocks_home/controllers/stocks_home_controller.dart';
import '../../../search_view.dart';

class StocksHomeAppBar extends StatelessWidget {
  StocksHomeAppBar({Key? key}) : super(key: key);
  final StocksHomeController _controller = Get.put(StocksHomeController());

  AppBar stocksHomeAppBar({context}) {
    return AppBar(
      leadingWidth: 0,
      centerTitle: false,
      elevation: .3,
      backgroundColor: const Color(0xff121212),
      title: const Text(
        "Stocks",
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.search_sharp,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              _controller.filteredListOfStocks.clear();
              Get.to(
                () => SearchView(

                ),
                transition: Transition.fadeIn,
              );
            },
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
