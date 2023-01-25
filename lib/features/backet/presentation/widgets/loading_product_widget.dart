import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';

import '../../../../constants/app_constatnts.dart';

class LoadingProductWidget extends StatelessWidget {
  const LoadingProductWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
          child: Scaffold(
              body: CustomScrollView(
            slivers: [
              SliverAppBar(
                iconTheme: const IconThemeData(color: Colors.white),
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
                    children: const [
                      Text(
                        '',
                        // state.oneProductModel!.title.ru,
                        style: TextStyle(
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
                              children: const [
                                IconButton(
                                  onPressed: null,
                                  icon:  Icon(Icons.remove),
                                ),
                                Text('1'),
                                IconButton(
                                  onPressed: null,
                                  icon:  Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                          const Padding(
                            padding:  EdgeInsets.only(right: 12),
                            child: Text(
                              'narxi',
                              style:  TextStyle(
                                  fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(12),
                        child: ElevatedButton(
                            onPressed: null,
                            child: Text('Добавить в корзину ')),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
  }
}