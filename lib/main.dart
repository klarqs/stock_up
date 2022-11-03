import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:stock_market_report/app/modules/splash/views/splash_view.dart';
import 'app/modules/stocks_home/controllers/stocks_home_controller.dart';

Future<void> main() async {
  final StocksHomeController controller = Get.put(StocksHomeController());
  runApp(const Home());
  await controller.execute(InternetConnectionChecker());

  final InternetConnectionChecker customInstance =
      InternetConnectionChecker.createInstance(
    checkTimeout: const Duration(seconds: 1),
    checkInterval: const Duration(seconds: 1),
  );

  await controller.execute(customInstance);
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      builder: BotToastInit(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        textTheme: GoogleFonts.dmSansTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: SplashView(),
    );
  }
}
