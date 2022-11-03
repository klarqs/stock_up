import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../controllers/splash_controller.dart';
import '../widgets/asset_fade_in_image.dart';

class SplashMobilePortrait extends GetView<SplashController> {
  final SplashController sc = Get.put(SplashController());

  SplashMobilePortrait({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: const Color(0xff121212),
      body: Stack(
        children: [
          Center(
            child: AssetFadeInImage(
              opacity: controller.logoOpacity,
              width: width * .44,
              fadeInDuration: sc.fadeInDuration,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AssetFadeInImage(
              opacity: controller.designOpacity,
              width: width,
            ),
          )
        ],
      ),
    );
  }
}
