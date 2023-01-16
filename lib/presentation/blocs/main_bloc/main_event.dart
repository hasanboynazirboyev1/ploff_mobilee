part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}
class MainInititalEvent extends MainEvent{}
class ActiveIndexEvent extends MainEvent{
  BuildContext? context;
  int? index;
  ActiveIndexEvent({this.index,this.context});
}
