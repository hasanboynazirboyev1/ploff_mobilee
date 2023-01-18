part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ProfileHomeState extends ProfileState{
   String? phone;
  String? name;
  List settingsList = [
    "Филиалы",
    "Настройки",
    "Мои адресы",
    "О сервисе",
  ];
  List svgPath = [
    "assets/svg_icons/profil_icons/local.svg",
    "assets/svg_icons/profil_icons/setting.svg",
    "assets/svg_icons/profil_icons/map.svg",
    "assets/svg_icons/profil_icons/oprog.svg",
  ];
  ProfileHomeState({this.phone,this.name});
}
