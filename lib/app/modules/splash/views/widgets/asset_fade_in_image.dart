import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssetFadeInImage extends StatelessWidget {
  final double width;
  final double? height;
  final Duration fadeInDuration;
  final Animation<double> opacity;

  const AssetFadeInImage({
    super.key,
    required this.width,
    this.height,
    this.fadeInDuration = const Duration(milliseconds: 700),
    required this.opacity,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width,
      child: FadeTransition(
        opacity: opacity,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: const [
              Icon(
                Icons.area_chart,
                size: 44,
                color: Colors.yellow,
              ),
              SizedBox(
                width: 12,
              ),
              Text(
                "Stock Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 32,
                  letterSpacing: -.2,
                  fontWeight: FontWeight.w900,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
