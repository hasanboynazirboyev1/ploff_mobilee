import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';
import 'package:ploff_mobile/presentation/screens/home/home_page.dart';
import 'package:ploff_mobile/presentation/screens/profile/profile_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_name_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
            children: const [
              HomePage(),
              Center(child: Text('zakaz')),
              Center(child: Text('aa')),
              ProfilePage(),
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
                  icon: SvgPicture.asset("assets/svg_icons/home.svg"),
                  label: "Главная",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/home_activ.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/cart3.svg"),
                  label: "Корзина",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/activ_shops.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/shop.svg"),
                  label: "Мои заказы",
                  activeIcon: SvgPicture.asset("assets/svg_icons/ashop.svg")),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset("assets/svg_icons/person.svg"),
                  label: "Профиль",
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/activ_user.svg")),
            ],
          ),
        );
      } else {
        return const CircularProgressIndicator();
      }
    }));
  }
}
