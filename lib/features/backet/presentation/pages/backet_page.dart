import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/backet/presentation/widgets/backet_default_widget.dart';
import 'package:ploff_mobile/features/backet/presentation/widgets/value_listanable_widget.dart';

class BacketPage extends StatefulWidget {
  BacketPage({super.key});

  @override
  State<BacketPage> createState() => _BacketPageState();
}

class _BacketPageState extends State<BacketPage> {
  @override
  Widget build(BuildContext context) {
    final backetBloc = context.read<BacketBloc>();
    return BlocBuilder<BacketBloc, BacketState>(
      builder: (context, state) {
        if (state is BacketHomeState) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                      onPressed: (() {
                        showDialog(
                            context: context,
                            builder: ((context) {
                              return AlertDialog(
                                title: const Text(
                                  'Очистить корзину?',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600),
                                ),
                                content: SizedBox(
                                  height: 100,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Вы уверены, что хотите очистить корзину?",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xff858585)),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25),
                                              height: 50,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color:
                                                      const Color(0xffF5F5F5)),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text(
                                                  "Нет",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                          InkWell(
                                            onTap: () {
                                              backetBloc.add(ClearBoxEvent());
                                              Navigator.pop(context);
                                            },
                                            child: Container(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 25),
                                              alignment: Alignment.center,
                                              height: 50,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),
                                                  color: Color(0xffFFCC00)),
                                              child: const Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 12),
                                                child: Text(
                                                  "Да",
                                                  style: TextStyle(
                                                      fontSize: 15,
                                                      color: Color(0xff000000),
                                                      fontWeight:
                                                          FontWeight.w600),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }));
                      }),
                      icon: SvgPicture.asset(
                          'assets/svg_icons/order_icons/ic_delate.svg'))
                ],
                title: const Text('Корзина'),
              ),
              body: HiveBoxses.getData().isNotEmpty
                  ? const ValueListanableWidget()
                  : const BacketDefaultWidget());
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
