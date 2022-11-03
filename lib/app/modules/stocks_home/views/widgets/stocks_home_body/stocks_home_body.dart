import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_report/app/modules/stock_details/views/stock_details_home_view.dart';
import 'package:stock_market_report/app/modules/stocks_home/views/widgets/stocks_home_body/widgets/stock_home_loader.dart';
import '../../../../../widgets/fade_in_animation.dart';
import '../../../controllers/stocks_home_controller.dart';
import '../../../models/all_stocks_activity_model.dart';

class StocksHomeBody extends StatelessWidget {
  StocksHomeBody({Key? key}) : super(key: key);
  final StocksHomeController _controller = Get.put(StocksHomeController());
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: FutureBuilder<TicketAssetModel?>(
                future: _controller.getTickets(),
                builder: (_, AsyncSnapshot<TicketAssetModel?> snapshot) {
                  final error =
                      snapshot.error.toString(); // typically returns null
                  if (snapshot.hasData) {
                    List<Datum>? data = snapshot.data!.data;
                    return ListView(
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 18,
                            vertical: 8,
                          ),
                          child: Text(
                            "10 Random Stocks",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              letterSpacing: .2,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                        ),
                        for (final index in _controller.tenRandomTickets!)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 18,
                              vertical: 8,
                            ),
                            child: InkWell(
                              splashColor: Colors.transparent,
                              borderRadius: BorderRadius.circular(12),
                              onTap: () => Get.to(
                                () => StockDetailsView(
                                  data![index].name,
                                  data![index].symbol,
                                ),
                                transition: Transition.fadeIn,
                              ),
                              child: FadeIn(
                                duration: const Duration(milliseconds: 400),
                                delay: const Duration(milliseconds: 200),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    // border: Border.all(
                                    //   color: Colors.white,
                                    //   width: .2,
                                    // ),
                                    color: Colors.white.withOpacity(.075),
                                  ),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 18,
                                        backgroundColor:
                                            Colors.white54.withOpacity(.1),
                                        child: const Icon(
                                          Icons.area_chart,
                                          size: 16,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 12,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: Get.width * .65,
                                            child: Text(
                                              data![index].name,
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                letterSpacing: .2,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.w900,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "${data![index].symbol} - ${data![index].stockExchange!.country.toString().split(".")[1]}",
                                            style: const TextStyle(
                                              color: Colors.white70,
                                              height: 2,
                                              letterSpacing: .2,
                                              fontSize: 10,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            maxLines: 2,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )
                      ],
                    );
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text(error));
                  }
                  return const StocksHomeLoader();
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
