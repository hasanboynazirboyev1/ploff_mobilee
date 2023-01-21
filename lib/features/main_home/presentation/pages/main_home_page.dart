import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/pages/backet_page.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/features/home/presentation/pages/home_page.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/profile/presentation/bloc/profile_bloc.dart';
// import 'package:ploff_mobile/presentation/screens/order/order_tapbar_page.dart';
import 'package:ploff_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_name_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../order/presentation/pages/orders_my/order_tapbar_page.dart';
import '../../main_bloc/main_bloc.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  @override
  Widget build(BuildContext context) {
    final blocnav = context.read<MainBloc>();
    return BlocBuilder<MainBloc, MainState>(builder: ((context, state) {
      if (state is MainHomeState) {
        return Scaffold(
          body: IndexedStack(
            index: state.activeIndex,
            children: [
              BlocProvider(
                create: (context) => HomeBloc()..add(HomeInitialEvent()),
                child: HomePage(),
              ),
              HiveExam(),
              BlocProvider(
                create: (context) => OrderBloc()..add(OrderInitialEvent()),
                child: OrderTabBarPage(),
              ),
              BlocProvider(
                create: (context) => ProfileBloc()..add(ProfileInitialEvent()),
                child: ProfilePage(),
              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: const Color(0xffFFCC00),
            unselectedItemColor: const Color(0xff9AA6AC),
            showUnselectedLabels: true,
            selectedLabelStyle: const TextStyle(fontSize: 10),
            unselectedFontSize: 10,
            currentIndex: state.activeIndex!,
            onTap: (v) {
              blocnav.add(ActiveIndexEvent(index: v, context: context));
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/home.svg"),
                  label: "Главная",
                  activeIcon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/home_activ.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/cart3.svg"),
                  label: "Корзина",
                  activeIcon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/activ_shops.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/shop.svg"),
                  label: "Мои заказы",
                  activeIcon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/ashop.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/person.svg"),
                  label: "Профиль",
                  activeIcon: SvgPicture.asset(
                      "assets/svg_icons/bottom_nav_icons/activ_user.svg")),
            ],
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }
}
