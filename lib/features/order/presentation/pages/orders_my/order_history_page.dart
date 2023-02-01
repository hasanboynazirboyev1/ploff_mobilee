import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:ploff_mobile/features/order/presentation/order_bloc/order_bloc.dart';
// import 'package:ploff_mobile/presentation/blocs/order_bloc/order_bloc.dart';
import 'package:ploff_mobile/features/order/presentation/widgets/order_info_widget.dart';



class OrderHistoryPage extends StatelessWidget {
  const OrderHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderBloc, OrderState>(
      builder: (context, state) {
       if (state is OrderHomeState) {
         return   Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverList(delegate: SliverChildBuilderDelegate(((context, index) {
                return const OrderNumberWidget();
              }),childCount: 3)),
            ],
          )
        );
       }else{
        return const CircularProgressIndicator();
       }
      },
    );
  }
}
