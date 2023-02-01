import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/constants/app_constatnts.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/widgets/order_datas_widget.dart';

class OrderActivePage extends StatelessWidget {
  const OrderActivePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
        if (state is OrderHomeState) {
          return Scaffold(
            body: RefreshIndicator(
              edgeOffset: 0,
              color: yellowColor,
              onRefresh: () async {
                return await DesigOrderApi.getOrder();
              },
              child: CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return OrderDatasWidget(
                        index: index,
                      );
                    },
                    childCount: (state.productOrderModel!.orders ?? []).length,
                  ),
                ),
              ]),
            ),
          );
        } else {
          return SizedBox();
        }
      },
    );
  }
}
