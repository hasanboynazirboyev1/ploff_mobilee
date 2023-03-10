import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ploff_mobile/aaa/test_screen.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/backet_page.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';
import 'package:ploff_mobile/features/design_order/presentation/pages/design_order_tabBar_page.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:ploff_mobile/features/main_home/presentation/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/splash/pages/splash_screen_page.dart';
import 'package:ploff_mobile/features/main_home/presentation/pages/main_home_page.dart';
import 'package:ploff_mobile/features/order/presentation/pages/orders_my/order_all_datas_page.dart';

import 'package:ploff_mobile/features/register/presentation/pages/confirm_logn_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_name_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_number_page.dart';
import 'package:ploff_mobile/routes/app_routes.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import 'features/register/presentation/bloc/register_bloc.dart';
import 'helpers/my_bloc_observer.dart';

void main() async {
  AndroidYandexMap.useAndroidViewSurface = false;
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(OneProductModelHiveAdapter());
  await Hive.openBox<OneProductModelHive>('productBox');
  Bloc.observer = MyBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (context) => MainBloc()..add(MainInititalEvent())),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      // home: TestClass(),
      onGenerateRoute: (settings) => AppRoutes.generateRoute(settings),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: ThemeData(
        progressIndicatorTheme:
            const ProgressIndicatorThemeData(color: yellowColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity, 48),
                elevation: 0,
                foregroundColor: Colors.black,
                alignment: Alignment.center,
                backgroundColor: yellowColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)))),
        scaffoldBackgroundColor: grayColor,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          color: Color(0xffFFFFFF),
          titleTextStyle: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600),
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
      ),
    );
  }
}
