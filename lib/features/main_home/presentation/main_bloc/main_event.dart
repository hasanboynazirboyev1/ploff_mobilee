part of 'main_bloc.dart';

@immutable
abstract class MainEvent {}
class MainInititalEvent extends MainEvent{}
class ActiveIndexEvent extends MainEvent{
  BuildContext? context;
  int? index;
  ActiveIndexEvent({this.index,this.context});
}
class ExitAccEvent extends MainEvent{
  BuildContext? context;
ExitAccEvent(this.context);
}
class ThrowfirstPageEvent extends MainEvent{}