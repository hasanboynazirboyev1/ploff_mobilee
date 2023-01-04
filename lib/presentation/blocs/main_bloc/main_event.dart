part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}
class MainInititalEvent extends MainEvent{}
class ActiveIndexEvent extends MainEvent{
  int? index;
  ActiveIndexEvent(this.index);
}
