part of 'design_order_bloc.dart';

@immutable
abstract class DesignOrderState {}

class DesignOrderInitial extends DesignOrderState {}

class DesignOrderHomeState extends DesignOrderState {
  NearestBranchModel? nearestBranchModel;
  CustomerAdressModel customerAdress;
  List<bool> checkBoleans;
  List<bool> checkPayments;
  double? longitude;
  double? latitude;
  List<bool>? checkCurier;
  List<bool>? checkClock;
  
  List imagePath = [
    'assets/svg_icons/design_order_icon/ic_money.svg',
    'assets/svg_icons/design_order_icon/ic_payme.svg',
    'assets/svg_icons/design_order_icon/ic_click.svg',
  ];
  List imagePathClock = [
    'assets/svg_icons/design_order_icon/ic_moto.svg',
    'assets/svg_icons/design_order_icon/ic_clock.svg',
  ];
  List paymentList = ['Наличные', 'Payme', 'Click'];
  DesignOrderHomeState(
      {this.nearestBranchModel,
      required this.checkBoleans,
      required this.checkPayments,
      this.latitude,
      this.longitude,
      required this.customerAdress,
      this.checkCurier,
      this.checkClock,
      });
  DesignOrderHomeState copyWith(
      {NearestBranchModel? nearestBranchModel,
      List<bool>? checkBoleans,
      List<bool>? checkPayments,
      double? longitude,
      double? latitude,
      CustomerAdressModel? customerAdress,
      List<bool>? checkCurier,
      List<bool>? checkClock,
      }) {
    return DesignOrderHomeState(
      checkPayments: checkPayments ?? this.checkPayments,
      nearestBranchModel: nearestBranchModel ?? this.nearestBranchModel,
      checkBoleans: checkBoleans ?? this.checkBoleans,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      customerAdress: customerAdress ?? this.customerAdress,
      checkCurier: checkCurier ?? this.checkCurier,
      checkClock: checkClock ?? this.checkClock
    );
  }
}
