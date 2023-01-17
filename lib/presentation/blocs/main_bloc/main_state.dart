part of 'main_bloc.dart';

@immutable
abstract class MainState {}

class MainInitial extends MainState {}

class MainHomeState extends MainState {
  bool? isActive ;
  String? phone;
  String? name;
  List settingsList = [
    "Филиалы",
    "Настройки",
    "Мои адресы",
    "О сервисе",
  ];
  List svgPath = [
    "assets/profil_icons/local.svg",
    "assets/profil_icons/setting.svg",
    "assets/profil_icons/map.svg",
    "assets/profil_icons/oprog.svg",
  ];
 
  int? activeIndex;
  MainHomeState({
    this.activeIndex,this.name,this.phone
  });
}
