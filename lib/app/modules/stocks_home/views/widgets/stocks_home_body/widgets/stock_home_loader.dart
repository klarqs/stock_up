import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StocksHomeLoader extends StatelessWidget {
  const StocksHomeLoader({Key? key}) : super(key: key);

  @override
  Center build(BuildContext context) {
    return const Center(
        child: CupertinoActivityIndicator(
      color: Colors.white,
    ));
  }
}
