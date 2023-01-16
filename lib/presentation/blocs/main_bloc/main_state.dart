part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainHomeState extends MainState {
  bool? isActive ;
 
  int? activeIndex;
  MainHomeState({
    this.activeIndex,
  });
}
