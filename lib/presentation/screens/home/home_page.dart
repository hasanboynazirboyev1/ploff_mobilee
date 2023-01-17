import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/presentation/blocs/home/home_bloc.dart';
import 'package:ploff_mobile/presentation/widgets/banner_widget.dart';
import 'package:ploff_mobile/presentation/widgets/product_data_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is HomePageState) {
          return Scaffold(
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final SharedPreferences prefs =
                    await SharedPreferences.getInstance();
                final name = prefs.getString('name');
                final phone = prefs.getString('phone');
                print(name);
                print(phone);
              },
            ),
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: MediaQuery.of(context).size.height * 0.2,
              backgroundColor: Colors.white,
              title: SizedBox(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: SizedBox(
                        child: Row(
                          children: [
                            SvgPicture.asset("assets/home_/maps.svg"),
                            const SizedBox(
                              width: 9,
                            ),
                            const Text(
                              "Добавить адрес",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Color(0xff2B2A28),
                                  fontWeight: FontWeight.w400),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            SvgPicture.asset("assets/home_/icon.svg"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                      height: 44,
                      child: TextFormField(
                        style: const TextStyle(fontSize: 15),
                        decoration: InputDecoration(
                          isDense: true,
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(
                                left: 10, bottom: 10, top: 10, right: 10),
                            child: SvgPicture.asset(
                              "assets/home_/search.svg",
                              width: 20,
                              height: 20,
                            ),
                          ),
                          hintText: "Поиск по всей еде",
                          hintStyle: const TextStyle(
                              fontSize: 15,
                              color: Color(0xff858585),
                              fontWeight: FontWeight.w400),
                          fillColor: const Color(0xffF5F5F5),
                          filled: true,
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                    ),
                    const Gap(16),
                    SizedBox(
                      height: 56,
                      child: ListView.builder(
                          itemCount: state.products!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                homeBloc.add(TapbarIndexEvent(index));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.only(bottom: 16, right: 8),
                                padding: const EdgeInsets.only(
                                    left: 15, right: 15, top: 10, bottom: 10),
                                height: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: state.tapbarBoleans![index]
                                        ? yellowColor
                                        : grayColor),
                                child: Text(
                                  state.products![index].title!.toString(),
                                  style: const TextStyle(
                                      fontSize: 15, color: Color(0xff2B2A28)),
                                ),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            ),
            body: const CustomScrollView(
              slivers: [
                BannerWidget(),
                ProductDataWidget(),
              ],
            ),
          );
        } else {
          return const Scaffold(
              body: Center(child: CircularProgressIndicator()));
        }
      },
    );
  }
}
