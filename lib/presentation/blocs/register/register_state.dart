part of 'register_bloc.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterHomeState extends RegisterState {
  TextEditingController numberController = TextEditingController();
  TextEditingController codeController = TextEditingController();
  TextEditingController nameController = TextEditingController();
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
}
