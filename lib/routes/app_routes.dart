import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/backet_page.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:ploff_mobile/features/home/presentation/pages/home_page.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/one_product_datas_page.dart';
import 'package:ploff_mobile/features/main_home/presentation/pages/main_home_page.dart';
import 'package:ploff_mobile/features/register/presentation/bloc/register_bloc.dart';
import 'package:ploff_mobile/features/register/presentation/pages/confirm_logn_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/register_connfirm_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_name_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_number_page.dart';
import 'package:ploff_mobile/features/splash/pages/splash_screen_page.dart';

class AppRoutes {
  static generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: ((context) =>  MainHomePage()));
      case 'mainhome':
        return MaterialPageRoute(builder: ((context) => const MainHomePage()));
      case 'home':
        return MaterialPageRoute(builder: ((context) => const HomePage()));
      case 'confirmlogin':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: ConfirmLoginPage(),
                )));
      case 'registerconfirm':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: RegisterConfirmPage(),
                )));
      case 'signname':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: const SignNamePage(),
                )));
      case 'signnumber':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => RegisterBloc(),
                  child: const SignNumberPage(),
                )));
                case 'oneproduct':
        return MaterialPageRoute(
            builder: ((context) => BlocProvider(
                  create: (context) => BacketBloc()..add(OneProductEvent()),
                  child:  OneProductDatasPage(),
                )));

      default:
    }
  }
}
