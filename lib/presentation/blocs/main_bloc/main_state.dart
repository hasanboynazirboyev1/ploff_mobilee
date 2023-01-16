part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainHomeState extends MainState {
  bool? isActive ;
  List <Widget>mainPageLis = [
    HomePage(),
    Center(child: Text('zakaz')),
    Center(child: Text('aa')),
    ProfilePage()
  ];
  int? activeIndex;
  MainHomeState({
    this.activeIndex,
  });
}
