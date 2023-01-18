part of 'order_bloc.dart';

@immutable
abstract class OrderState {}

class OrderInitial extends OrderState {}
class OrderHomeState extends OrderState {
List orderDatasKeyList = [
  "Адрес",
  "Время",
  "Дата",
  "Способ оплаты",
];
List orderDatasValList = [
  "Массив Бешягач 19",
  "20:56",
  "11.05.2022",
  "Наличные",
];
List orderIconList = [
  "assets/svg_icons/order_icons/ic_location.svg",
  "assets/svg_icons/order_icons/ic_clock.svg",
  "assets/svg_icons/order_icons/ic_vector.svg",
  "assets/svg_icons/order_icons/ic_creditcard.svg",
];

}

