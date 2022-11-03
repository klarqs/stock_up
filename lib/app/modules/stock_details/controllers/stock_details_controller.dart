import 'dart:math';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';
import '../../stocks_home/controllers/stocks_home_controller.dart';
import '../../stocks_home/models/all_stocks_activity_model.dart';
import '../models/stock_details_model.dart';

class StockDetailsController extends GetxController {
  final StocksHomeController _stocksHomeController =
      Get.put(StocksHomeController());
  FocusNode focusNode = FocusNode();
  DateFormat formattedDate = DateFormat.MMMMEEEEd(),
      formattedRangeDate = DateFormat.MMMMd(),
      apiDateFormat = DateFormat('yyyy-MM-dd');
  Rx<bool?> isInternetAvailableStreamStatus = false.obs;
  StreamSubscription<bool>? networkConnectionStream;
  TicketAssetModel? ticketAssetData;
  TicketEodDetail? ticketEodDetail;

  List<dynamic>? tenRandomTickets =
      List.generate(10, (_) => Random.secure().nextInt(100));

  String apiKey = "68b27d450a72b09bf9510d8711d13dda", limit = "100";

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    if (args.value is PickerDateRange) {
      _stocksHomeController.range.value =
          ' ${formattedRangeDate.format(args.value.endDate ?? args.value.startDate)} - '
          '${formattedRangeDate.format(args.value.startDate)}';
      _stocksHomeController.dateFrom.value =
          apiDateFormat.format(args.value.startDate).toString();
      _stocksHomeController.dateTo.value = apiDateFormat
          .format(args.value.endDate ?? args.value.startDate)
          .toString();
    } else if (args.value is DateTime) {
      _stocksHomeController.selectedDate.value = args.value.toString();
    } else if (args.value is List<DateTime>) {
      _stocksHomeController.dateCount.value = args.value.length.toString();
    } else {
      _stocksHomeController.rangeCount.value = args.value.length.toString();
    }
  }

  Future<TicketEodDetail?> getEods({symbol = "AAPL"}) async {
    var eodUrl = _stocksHomeController.dateFrom.value == '' &&
            _stocksHomeController.dateTo.value == ''
        ? 'http://api.marketstack.com/v1/eod?access_key=$apiKey&symbols=$symbol'
        : "http://api.marketstack.com/v1/eod?access_key=$apiKey&symbols=$symbol&date_from=${_stocksHomeController.dateFrom.value}&date_to=${_stocksHomeController.dateTo.value}";
    try {
      var response = await Dio().get(eodUrl);
      ticketEodDetail = TicketEodDetail.fromJson(response.data);
      return ticketEodDetail;
    } catch (e) {
      print(e);
    }
    return null;
  }

  @override
  void onInit() {
    super.onInit();
    focusNode = FocusNode();
    focusNode.addListener(_onOnFocusNodeEvent);
  }

  void _onOnFocusNodeEvent() {
    update();
  }

  @override
  void dispose() async {
    focusNode.dispose();
    super.dispose();
  }
}
