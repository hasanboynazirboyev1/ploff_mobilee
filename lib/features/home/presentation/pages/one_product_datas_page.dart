import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/backet/presentation/bloc/backet_bloc.dart';
import 'package:ploff_mobile/features/home/data/models/one_product_model.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/presentation/bloc/home_bloc.dart';

import '../../../backet/data/models/product_model.dart';

class OneProductDatasPage extends StatefulWidget {
  List< ProductEntity>? product;
  int? index;
  OneProductDatasPage({super.key,this.product ,this.index});

  @override
  State<OneProductDatasPage> createState() => _OneProductDatasPageState();
}

class _OneProductDatasPageState extends State<OneProductDatasPage> {
  @override
  Widget build(BuildContext context) {
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
                       widget.product![widget.index!].title!,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 12,bottom: 23,top: 16),
                        child: Text('Размер*',style: TextStyle(fontSize: 17,fontWeight: FontWeight.w600),),
                      ),
                      
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 113,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.remove),
                                Text('1'),
                                Icon(Icons.add)
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(right: 12),
                            child: Text(widget.product![widget.index!].outPrice!.toString(),style: TextStyle(fontSize: 17,fontWeight: FontWeight.w700),),
                          ),
                          
                          
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: ElevatedButton(

                          onPressed: (() {
                              
                            }), child: const Text('Добавить в корзину ')),
                      ),
                          
                    ],
                  ),
                ),
              ),
            ],
          )),
        );
      } else {
        return const Center(child:  CircularProgressIndicator());
      }
    });
  }
}