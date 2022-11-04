import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_report/app/modules/stock_details/controllers/stock_details_controller.dart';
import 'package:stock_market_report/app/modules/stock_details/views/widgets/stock_details_home_body/widgets/stock_details_loader.dart';
import 'package:stock_market_report/app/modules/stocks_home/controllers/stocks_home_controller.dart';
import '../../../../../widgets/fade_in_animation.dart';
import '../../../models/stock_details_model.dart';

class StockDetailsBody extends StatefulWidget {
  const StockDetailsBody({
    Key? key,
    required this.symbol,
    required this.name,
  }) : super(key: key);

  final String symbol, name;

  @override
  State<StockDetailsBody> createState() => _StockDetailsBodyState();
}

class _StockDetailsBodyState extends State<StockDetailsBody> {
  final StockDetailsController _controller = Get.put(StockDetailsController());
  final StocksHomeController _homeController = Get.put(StocksHomeController());

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FutureBuilder<TicketEodDetail?>(
        future: _controller.getEods(
          symbol: widget.symbol,
        ),
        builder: (_, AsyncSnapshot<TicketEodDetail?> snapshot) {
          final error = snapshot.error.toString(); // typically returns null
          if (snapshot.hasData) {
            List<Datumu>? data = snapshot.data!.data;
            if (snapshot.data!.data!.isNotEmpty) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                    ),
                    child: Obx(
                      () => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.symbol,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                widget.name,
                                style: const TextStyle(
                                  color: Colors.white54,
                                  height: 2,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _homeController.range.value == "" ? 0 : 32,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                _homeController.range.value == ""
                                    ? ""
                                    : 'Selected range:',
                                style: const TextStyle(
                                  color: Colors.white54,
                                  // height: 2.5,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                ' ${_homeController.range.value}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  // height: 2.5,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _homeController.range.value == "" ? 0 : 4,
                  ),
                  Column(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      for (int i = 0; i < snapshot.data!.data!.length; i++)
                        FadeIn(
                          duration: const Duration(milliseconds: 400),
                          delay: const Duration(milliseconds: 200),
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 16,
                            ),
                            decoration: BoxDecoration(
                              // border: Border.all(
                              //   color: Colors.white,
                              //   width: .2,
                              // ),
                              color: Colors.white.withOpacity(.075),
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  " ${_controller.formattedDate.format(DateTime.parse(data![i].date.toString()))}",
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    // height: 1.8,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                const Text(
                                  "Overview",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 12,
                                    letterSpacing: .2,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Close',
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "\$${data![i].close.toString()}",
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 16,
                                              height: 1.4,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Open',
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "\$${data![i].open.toString()}",
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 16,
                                              height: 1.4,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            'Day Low',
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "\$${data![i].low.toString()}",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.9),
                                              fontSize: 16,
                                              height: 1.4,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          const Text(
                                            'Day High',
                                            style: TextStyle(
                                              color: Colors.white54,
                                              fontSize: 10,
                                              height: 1.8,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                          Text(
                                            "\$${data![i].high.toString()}",
                                            style: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(.9),
                                              fontSize: 16,
                                              height: 1.4,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                ],
              );
            } else if (snapshot.data!.data!.isEmpty) {
              const Text(
                "No Data!",
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 14,
                  height: 1.8,
                  fontWeight: FontWeight.w400,
                ),
              );
            }
          }
          if (snapshot.hasError) {
            return Center(child: Text(error));
          }
          return const StockDetailsLoader();
        },
      ),
    );
  }
}
