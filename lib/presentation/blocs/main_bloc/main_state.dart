part of 'main_bloc.dart';

@immutable
abstract class MainState {
  List page = [HomePage(), Text(''), Text('ss'), ProfilePage()];

}

class MainInitial extends MainState {}

class MainHomeState extends MainState {
  
  int activeIndex;
  MainHomeState(this.activeIndex,);
}