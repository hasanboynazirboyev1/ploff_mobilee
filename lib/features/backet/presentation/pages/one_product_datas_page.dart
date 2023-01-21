import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_repo.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/home/data/models/one_product_model.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';

import '../../data/models/product_model.dart';

class OneProductDatasPage extends StatefulWidget {
  OneProductDatasPage({super.key, });

  @override
  State<OneProductDatasPage> createState() => _OneProductDatasPageState();
}

class _OneProductDatasPageState extends State<OneProductDatasPage> {
  @override
  Widget build(BuildContext context) {
    final backetBloc = context.read<BacketBloc>();
    return BlocBuilder<BacketBloc, BacketState>(builder: (context, state) {
      if (state is BacketHomeState) {
        return SafeArea(
          child: Scaffold(
              body: CustomScrollView(
            // physics: NeverScrollableScrollPhysics(),

            slivers: [
              SliverAppBar(
                iconTheme: IconThemeData(color: Colors.white),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                ),
                backgroundColor: yellowColor,
                centerTitle: true,
                expandedHeight: 240,
                floating: false,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    'assets/home_/123.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                bottom: PreferredSize(
                    preferredSize: Size(400, 10),
                    child: Container(
                      height: 12,
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(12),
                              topRight: Radius.circular(12))),
                    )),
              ),
              SliverToBoxAdapter(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  height: 168,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(12),
                        bottomRight: Radius.circular(12)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        // '',
                        state.oneProductModel!.title.ru,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
              ),
              SliverGap(170),
              SliverToBoxAdapter(
                child: Container(
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 12, bottom: 23, top: 16),
                        child: Text(
                          'Размер*',
                          style: TextStyle(
                              fontSize: 17, fontWeight: FontWeight.w600),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            width: 113,
                            height: 44,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                IconButton(
                                  onPressed: (() {
                                    backetBloc.add(DecrementNumEvent());
                                  }),
                                  icon: const Icon(Icons.remove),
                                ),
                                Text('${state.productNum}'),
                                IconButton(
                                  onPressed: (() {
                                    backetBloc.add(IncrementNumEvent());
                                  }),
                                  icon: const Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(
                               '${state.oneProductModel!.outPrice * state.productNum} SUM',
                              
                              style: const TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(
                            onPressed: (() async {
                              HiveRepo.setHive(
                                  oneProductModel: state.oneProductModel);
                            }),
                            child: const Text('Добавить в корзину ')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
      } else {
        return const Center(child: CircularProgressIndicator());
      }
    });
  }
}
