import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';


part 'order_event.dart';
part 'order_state.dart';

class OrderBloc extends Bloc<OrderEvent, OrderState> {
  OrderBloc() : super(OrderInitial()) {
    on<OrderEvent>((event, emit) {
      emit(OrderHomeState());
    });
    // on<OrderInitialEvent>((event, emit) {
    //   final state = this.state as OrderHomeState;
      
    //   emit(OrderHomeState()); 
    // });
  }
}
