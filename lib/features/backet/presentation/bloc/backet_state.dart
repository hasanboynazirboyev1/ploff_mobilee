part of 'backet_bloc.dart';

@immutable
abstract class BacketState {}

class BacketInitial extends BacketState {}
class BacketHomeState extends BacketState{
  
  BacketHomeState();
}
