import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';


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
          body: state.page[state.activeIndex],
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            fixedColor: Color(0xffFFCC00),
            unselectedItemColor: Color(0xff9AA6AC),
            showUnselectedLabels: true,
            selectedLabelStyle: TextStyle(fontSize: 10),
            unselectedFontSize: 10,
            currentIndex: state.activeIndex,
            onTap: (v) {
              blocnav.add(ActiveIndexEvent(v));
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
                  activeIcon:
                      SvgPicture.asset("assets/svg_icons/ashop.svg")),
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
