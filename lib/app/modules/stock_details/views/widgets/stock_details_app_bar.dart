import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stock_market_report/app/modules/stock_details/views/stock_details_home_view.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../stocks_home/controllers/stocks_home_controller.dart';
import '../../controllers/stock_details_controller.dart';

class StockDetailsAppBar extends StatelessWidget {
  StockDetailsAppBar({Key? key}) : super(key: key);

  final StockDetailsController _controller = Get.put(StockDetailsController());
  final StocksHomeController _homeController = Get.put(StocksHomeController());

  PreferredSize stockDetailsAppBar({
    required String name,
    required String symbol,
  }) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(50.0),
      child: AppBar(
        elevation: 0,
        leading: IconButton(
          splashRadius: 20,
          icon: const Icon(
            Icons.arrow_back_outlined,
            color: Colors.white,
            size: 20,
          ),
          onPressed: () {
            _homeController.range.value = "";
            Get.back();
          },
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff121212),
        title: const Text(
          "Stock Details",
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(
            splashRadius: 20,
            icon: const Icon(
              Icons.date_range_rounded,
              color: Colors.white,
              size: 20,
            ),
            onPressed: () {
              showDialog(
                context: Get.context!,
                builder: (context) => AlertDialog(
                  backgroundColor: const Color(0xff1F1F1F),
                  content: SizedBox(
                    width: Get.width,
                    height: 404,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Date Range',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        SfDateRangePicker(
                          maxDate: DateTime.now(),
                          selectionColor: Colors.yellow,
                          rangeSelectionColor: Colors.white70,
                          todayHighlightColor: Colors.yellow,
                          onSelectionChanged: _controller.onSelectionChanged,
                          selectionMode: DateRangePickerSelectionMode.range,
                          view: DateRangePickerView.month,
                          yearCellStyle: const DateRangePickerYearCellStyle(
                            textStyle: TextStyle(color: Colors.white),
                            leadingDatesTextStyle:
                                TextStyle(color: Colors.white),
                          ),
                          headerStyle: const DateRangePickerHeaderStyle(
                            textStyle: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                          monthViewSettings: DateRangePickerMonthViewSettings(
                            dayFormat: 'EEE',
                            viewHeaderStyle:
                                const DateRangePickerViewHeaderStyle(
                              textStyle: TextStyle(
                                color: Colors.white54,
                                fontSize: 10,
                                letterSpacing: .5,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            blackoutDates: [
                              DateTime(2020, 03, 26),
                            ],
                            weekendDays: const [7, 6],
                            specialDates: [
                              DateTime(2020, 03, 20),
                              DateTime(2020, 03, 16),
                              DateTime(2020, 03, 17)
                            ],
                            showTrailingAndLeadingDates: true,
                          ),
                          monthCellStyle: DateRangePickerMonthCellStyle(
                            weekendTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                            blackoutDateTextStyle: const TextStyle(
                              color: Colors.white54,
                            ),
                            disabledDatesTextStyle: TextStyle(
                                color: Colors.white54.withOpacity(.15)),
                            textStyle: const TextStyle(color: Colors.white),
                            trailingDatesTextStyle:
                                const TextStyle(color: Colors.white54),
                            leadingDatesTextStyle:
                                const TextStyle(color: Colors.white54),
                            blackoutDatesDecoration: BoxDecoration(
                              color: Colors.red,
                              border: Border.all(
                                color: const Color(0xFFF44436),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            specialDatesDecoration: BoxDecoration(
                              color: Colors.green,
                              border: Border.all(
                                color: const Color(0xFF2B732F),
                                width: 1,
                              ),
                              shape: BoxShape.circle,
                            ),
                            specialDatesTextStyle: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 16.0,
                          ),
                          child: InkWell(
                            borderRadius: BorderRadius.circular(6),
                            splashColor: Colors.transparent,
                            highlightColor: Colors.white12,
                            onTap: () {
                              Get.back();
                              Get.back();
                              Get.to(
                                () => StockDetailsView(name, symbol),
                                transition: Transition.fadeIn,
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16.0,
                                vertical: 8.0,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.white12,
                              ),
                              child: Text(
                                "Filter".toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 4,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
