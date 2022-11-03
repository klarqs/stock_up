import 'dart:math';
import 'package:bot_toast/bot_toast.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'dart:async';
import 'package:intl/intl.dart';
import '../../stock_details/models/stock_details_model.dart';
import '../models/all_stocks_activity_model.dart';

class StocksHomeController extends GetxController {
  FocusNode focusNode = FocusNode();
  DateFormat formattedDate = DateFormat.yMMMMEEEEd();
  Rx<bool?> isInternetAvailableStreamStatus = false.obs;
  StreamSubscription<bool>? networkConnectionStream;
  TicketAssetModel? ticketAssetData;
  TicketEodDetail? ticketEodDetail;
  Rx<bool> isSearchControllerEmpty = false.obs, hasConnection = false.obs;

  List<Datum> listOfStocks = <Datum>[];
  RxList<Datum> filteredListOfStocks = <Datum>[].obs;
  Rx<String> dateFrom = "".obs, dateTo = "".obs;

  List<dynamic>? tenRandomTickets =
      List.generate(10, (_) => Random.secure().nextInt(100));

  final String apiKey = "68b27d450a72b09bf9510d8711d13dda", limit = "100";

  RxString selectedDate = ''.obs,
      dateCount = ''.obs,
      range = ''.obs,
      rangeCount = ''.obs;

  Future<TicketAssetModel?> getTickets() async {
    var ticketsUrl =
        "http://api.marketstack.com/v1/tickers?access_key=$apiKey&limit=$limit";
    try {
      var response = await Dio().get(ticketsUrl);
      ticketAssetData = TicketAssetModel.fromJson(response.data);
      listOfStocks.clear();
      for (int i = 0; i < ticketAssetData!.data!.length; i++) {
        listOfStocks.add(ticketAssetData!.data![i]);
      }
      return ticketAssetData;
    } catch (e) {
      print(e);
    }
    return null;
  }

  List<Datum> getSuggestions(String query) {
    filteredListOfStocks.clear();
    for (int i = 0; i < listOfStocks!.length; i++) {
      filteredListOfStocks.addIf(
        listOfStocks[i].name.toLowerCase().startsWith(query.toLowerCase()),
        listOfStocks[i],
      );
    }
    return filteredListOfStocks;
  }

  Future<void> execute(
    InternetConnectionChecker internetConnectionChecker,
  ) async {
    final StreamSubscription<InternetConnectionStatus> listener =
        InternetConnectionChecker().onStatusChange.listen(
      (InternetConnectionStatus status) {
        switch (status) {
          case InternetConnectionStatus.connected:
            BotToast.showCustomNotification(
              dismissDirections: const [
                DismissDirection.vertical,
                DismissDirection.down
              ],
              duration: const Duration(milliseconds: 3500),
              enableSlideOff: false,
              crossPage: true,
              onlyOne: false,
              enableKeyboardSafeArea: false,
              toastBuilder: (void Function() cancelFunc) {
                hasConnection.value = true;
                return Container(
                  height: 14,
                  color: Colors.green,
                  width: Get.width,
                  child: const Center(
                    child: Text(
                      "Connected",
                      style: TextStyle(
                          fontSize: 10, color: Colors.white, letterSpacing: .2),
                    ),
                  ),
                );
              },
            );
            break;
          case InternetConnectionStatus.disconnected:
            BotToast.showCustomNotification(
              duration: const Duration(
                milliseconds: 3500,
              ),
              dismissDirections: const [
                DismissDirection.vertical,
                DismissDirection.down
              ],
              enableSlideOff: false,
              crossPage: true,
              onlyOne: false,
              enableKeyboardSafeArea: false,
              toastBuilder: (void Function() cancelFunc) {
                return Container(
                  height: 14,
                  color: Colors.black,
                  width: Get.width,
                  child: const Center(
                    child: Text(
                      'No internet connection',
                      style: TextStyle(
                          fontSize: 10, color: Colors.white, letterSpacing: .2),
                    ),
                  ),
                );
              },
            );
            break;
        }
      },
    );

    await Future<void>.delayed(const Duration(seconds: 30));
    await listener.cancel();
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
