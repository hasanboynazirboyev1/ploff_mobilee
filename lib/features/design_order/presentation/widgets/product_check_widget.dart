import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/local/hive/hive_model.dart';
import 'package:ploff_mobile/features/design_order/presentation/bloc/design_order_bloc.dart';

import '../../../backet/data/datasourse/local/hive/hive_boxses.dart';

class ProductCheckWidget extends StatefulWidget {
   ProductCheckWidget({super.key});

  @override
  State<ProductCheckWidget> createState() => _ProductCheckWidgetState();
}

class _ProductCheckWidgetState extends State<ProductCheckWidget> {
   int  inPrice = 0;

   @override
  void initState() {
    
    super.initState();
  }

  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DesignOrderBloc, DesignOrderState>(
        builder: (context, state) {
      if (state is DesignOrderHomeState) {
        
        return Container(
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.all(16),
                child: Text(
                  'Чек',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                ),
              ),
              ValueListenableBuilder(
                valueListenable: HiveBoxses.getData().listenable(),
                builder: (context, Box<OneProductModelHive> box, child) {
                  final products = HiveBoxses.getProduct(box);
                  
                  return Column(
                    children: [
                      ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: products.length,
                          itemBuilder: ((context, index) {
                            return ListTile(
                              title: Text(
                                  "${products[index].title} x ${products[index].count}",
                                  style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xff858585))),
                              trailing: Text(
                                "${int.parse(products[index].count) * products[index].outPrice} sum",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xff858585)),
                              ),
                            );
                          })),
                       ListTile(
                          title: Text('Общая сумма',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600)),
                          trailing: Text(products[0].inPrice.toString(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600))),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      } else {
        return SizedBox();
      }
    });
  }

  
}
