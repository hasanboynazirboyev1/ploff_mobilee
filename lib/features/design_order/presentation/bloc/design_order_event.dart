part of 'design_order_bloc.dart';

@immutable
abstract class DesignOrderEvent {}
 class DesignOrderInitialEvent extends DesignOrderEvent {}
 class CheckBoxFilialEvent extends DesignOrderEvent {
  int? index;
  CheckBoxFilialEvent({this.index,});
 }
 class CheckBoxPaymentlEvent extends DesignOrderEvent {
  int? index;
  CheckBoxPaymentlEvent(this.index);
 }
 class CheckBoxCurierEvent extends DesignOrderEvent{
  int? index;
  CheckBoxCurierEvent(this.index);
 }
 class CheckBoxClockEvent extends DesignOrderEvent{
  int? index;
  CheckBoxClockEvent(this.index);
 }
