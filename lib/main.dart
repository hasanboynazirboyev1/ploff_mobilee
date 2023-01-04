
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/home/home_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/presentation/blocs/register/register_bloc.dart';
import 'package:ploff_mobile/presentation/screens/components/splash_screen_page.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';

void main() {
  runApp(MultiBlocProvider(providers: [
    BlocProvider(
        create: (context) =>
            MainBloc()..add(MainInititalEvent())),
            BlocProvider(create: (context) => RegisterBloc()..add(RegisterInitialEvent())),
            BlocProvider(create: (context)=> HomeBloc()..add(HomeInitialEvent())
            
            )
  ], child: const  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Color(0xffF5F5F5)),
      home:const SplashScreenPage(),
    );
  }
}
