part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent {}
class RegisterInitialEvent extends RegisterEvent{}
class SignNumberEvent extends RegisterEvent{
  BuildContext? context;
  SignNumberEvent(this.context);
}
class SignNameEvent extends RegisterEvent{
  BuildContext? context;
  SignNameEvent(this.context);
}
class ConfirmLoginEvent extends RegisterEvent{}
class RegisterConfirmEvent extends RegisterEvent{
  BuildContext? context;
  RegisterConfirmEvent(this.context);
} 
class ExitAccEvent extends RegisterEvent{
  BuildContext? context;
ExitAccEvent(this.context);
}
