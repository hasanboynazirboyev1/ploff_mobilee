import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  late bool isActive;
 

  @override
  void initState() {
    // getOrders();
    Timer(const Duration(seconds: 2),
        (() => Navigator.pushReplacementNamed(context, 'mainhome')));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(),
          Center(child: Image.asset("assets/img/splash.png")),
          const SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              color: Color(0xff9AA6AC),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
