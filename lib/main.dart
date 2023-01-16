import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/blocs/home/home_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/presentation/screens/components/splash_screen_page.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';
import 'package:ploff_mobile/presentation/screens/register/confirm_logn_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_name_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_number_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(create: (context) => MainBloc()..add(MainInititalEvent())),
    BlocProvider(
        create: (context) => RegisterBloc()..add(RegisterInitialEvent())),
    BlocProvider(create: (context) => HomeBloc()..add(HomeInitialEvent()))
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: grayColor,
        appBarTheme: const AppBarTheme(
          iconTheme: IconThemeData(color: Colors.black),
          color: Color(0xffF5F5F5),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
      home: const MainHomePage(),
    );
  }
}
