part of 'backet_bloc.dart';

@immutable
abstract class BacketEvent {}
class BacketIniitialEvent extends BacketEvent{}
class OneProductEvent extends BacketEvent{
  String? id;
  OneProductEvent({this.id});
}
class IncrementNumEvent extends BacketEvent{}
class DecrementNumEvent extends BacketEvent{}
class AddProductHiveEvent extends BacketEvent{}
class ClearBoxEvent extends BacketEvent{}
class DelateProdEvent extends BacketEvent{
  String? id;
  DelateProdEvent(this.id);
}




