import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/backet/data/repository/backet_servise_api.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/widgets/add_comment_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../design_order/data/repository/design_order_api.dart';
import '../../data/datasourse/local/hive/hive_boxses.dart';

class ValueListanableWidget extends StatefulWidget {
  const ValueListanableWidget({super.key});

  @override
  State<ValueListanableWidget> createState() => _ValueListanableWidgetState();
}

class _ValueListanableWidgetState extends State<ValueListanableWidget> {
  int? inPrice;
  @override
  Widget build(BuildContext context) {
    final backetBloc = context.read<BacketBloc>();
    return BlocBuilder<BacketBloc, BacketState>(
      builder: (context, state) {
        if (state is BacketHomeState) {
          return Scaffold(
            body: ValueListenableBuilder(
              valueListenable: HiveBoxses.getData().listenable(),
              builder: (BuildContext context, Box<OneProductModelHive> box,
                  Widget? child) {
                final products = HiveBoxses.getProduct(box);
                return ListView(
                  children: [
                    ListView.separated(
                        shrinkWrap: true,
                        padding: EdgeInsets.symmetric(vertical: 16),
                        itemBuilder: ((context, index) {
                          return Container(
                              height: 140,
                              padding: const EdgeInsets.only(
                                  left: 16, right: 16, top: 16, bottom: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      height: 104,
                                      width: 104,
                                      child:
                                          Image.asset('assets/home_/123.jpg'),
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          products[index].title,
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "${products[index].outPrice * int.parse(products[index].count)} so'm",
                                          style: const TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          IconButton(
                                              onPressed: (() async {
                                                backetBloc.add(DelateProdEvent(
                                                    products[index].id));
                                              }),
                                              icon: const Icon(
                                                Icons.clear,
                                                size: 16,
                                              )),
                                          Container(
                                            decoration: BoxDecoration(
                                                border: Border.all(),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            width: 115,
                                            height: 30,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                IconButton(
                                                  onPressed: (() {
                                                    final count = int.parse(
                                                        products[index].count);
                                                    if (count > 1) {
                                                      box.put(
                                                          products[index].id,
                                                          products[index].copyWith(
                                                              count: (count - 1)
                                                                  .toString()));
                                                    }
                                                  }),
                                                  icon: const Icon(
                                                    Icons.remove,
                                                    size: 16,
                                                  ),
                                                ),
                                                Text(
                                                  products[index].count,
                                                  style: const TextStyle(
                                                      fontSize: 14),
                                                ),
                                                IconButton(
                                                  onPressed: (() {
                                                    final count = int.parse(
                                                        products[index].count);
                                                    box.put(
                                                        products[index].id,
                                                        products[index].copyWith(
                                                            count: (count + 1)
                                                                .toString()));
                                                  }),
                                                  icon: const Icon(
                                                    Icons.add,
                                                    size: 16,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ])
                                  ]));
                        }),
                        separatorBuilder: ((context, index) {
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            color: whiteColor,
                            child: Divider(thickness: 1),
                          );
                        }),
                        itemCount: products.length),
                    AddCommentWidget(),
                  ],
                );
              },
            ),
            bottomSheet: Container(
              color: whiteColor,
              padding: EdgeInsets.all(16),
              child: ElevatedButton(
                child: const Text('Оформить заказ'),
                onPressed: () async {
                  Navigator.pushNamed(context, 'designorder');
                  await DesigOrderApi.getNearestBranch();
                },
              ),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
