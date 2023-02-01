part of 'order_bloc.dart';

@immutable
abstract class OrderEvent {}
class OrderInitialEvent extends OrderEvent{}
class GetOrderDatasEvent extends OrderEvent{
  BuildContext? context;
  GetOrderDatasEvent(this.context);
}
