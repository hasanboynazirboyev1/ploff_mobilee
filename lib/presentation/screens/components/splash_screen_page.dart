import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_name_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_number_page.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2),(() =>  Navigator.pushReplacement(context, MaterialPageRoute(builder: ((context) => const SignNumberPage())))));
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
          const  SizedBox(
            width: 20,
            height: 20,
            child:  CircularProgressIndicator(
              color: Color(0xff9AA6AC),
              strokeWidth: 3,
            ),
          ),
        ],
      ),
    );
  }
}
