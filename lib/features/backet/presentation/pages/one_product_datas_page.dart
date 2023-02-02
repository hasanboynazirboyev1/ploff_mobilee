import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_boxses.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_repo.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/backet/presentation/widgets/loading_product_widget.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/home/data/models/one_product_model.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';
import 'package:ploff_mobile/features/main_home/presentation/main_bloc/main_bloc.dart';

class OneProductDatasPage extends StatefulWidget {
  const OneProductDatasPage({
    super.key,
  });

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
          top: false,
          child: Scaffold(
              body: CustomScrollView(
            slivers: [
              SliverAppBar(
                leading: IconButton(onPressed: (() {
                  Navigator.pop(context);
                }), icon: SvgPicture.asset('assets/svg_icons/order_icons/ic_back.svg')),
                actions: [
                  SvgPicture.asset('assets/svg_icons/order_icons/ic_connect.svg'),
                ],
                iconTheme: const IconThemeData(color: Colors.white),
                systemOverlayStyle: const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarIconBrightness: Brightness.light,
                  statusBarBrightness: Brightness.dark,
                ),
                backgroundColor: yellowColor,
                expandedHeight: 240,
                
                flexibleSpace: Stack(
                      children: [
                        Positioned(
                          child: Container(
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image:
                                        AssetImage("assets/home_/123.jpg"))),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            height: 7,
                            decoration: const BoxDecoration(
                                color: Color(0xffffffff),
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12),
                                    topRight: Radius.circular(12))),
                          ),
                        ),
                      ],
                    )
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
              const SliverGap(170),
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
                            margin: const EdgeInsets.only(left: 16),
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            width: 120,
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
                              backetBloc.add(AddProductHiveEvent());
                              Navigator.pop(context);
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
        return const LoadingProductWidget();
      }
    });
  }
}
