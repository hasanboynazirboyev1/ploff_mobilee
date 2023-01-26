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

import '../../../design_order/data/repository/design_order_api.dart';
import '../../data/datasourse/local/hive/hive_boxses.dart';

class ValueListanableWidget extends StatelessWidget {
  const ValueListanableWidget({super.key});

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
                return CustomScrollView(
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsets.all(12),
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate((context, index) {
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  height: 104,
                                  width: 104,
                                  child: Image.asset('assets/home_/123.jpg'),
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
                                  crossAxisAlignment: CrossAxisAlignment.end,
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
                                      // margin: EdgeInsets.only(left: 16),
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
                                            style:
                                                const TextStyle(fontSize: 14),
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
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        }, childCount: products.length),
                      ),
                    ),
                    SliverFillRemaining(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            color: whiteColor,
                            padding: EdgeInsets.all(16),
                            child: ElevatedButton(
                              child: Text('Оформить заказ'),
                              onPressed: () {
                                Navigator.pushNamed(context, 'designorder');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
            ),
           
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
