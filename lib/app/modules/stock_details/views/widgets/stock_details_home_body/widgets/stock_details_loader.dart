import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StockDetailsLoader extends StatelessWidget {
  const StockDetailsLoader({Key? key}) : super(key: key);

  @override
  Center build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.only(top: 100.0),
        child: CupertinoActivityIndicator(
          color: Colors.white,
        ),
      ),
    );
  }
}
