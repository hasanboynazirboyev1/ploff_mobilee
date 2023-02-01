import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/order/data/models/product_order_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {
      emit(OrderHomeState());
    });
    on<OrderInitialEvent>((event, emit) async {
      final prod = await DesigOrderApi.getOrder();
      emit(OrderHomeState(productIsActive: false,productOrderModel: prod));
    });
    on<GetOrderDatasEvent>((event, emit) async {
      final state = this.state as OrderHomeState;
      

      final prod = await DesigOrderApi.getOrder();
      Navigator.pushNamedAndRemoveUntil(
          event.context!, 'mainhome', (route) => false);

      emit(OrderHomeState(productOrderModel: prod, productIsActive: true));
    });
  }
}
