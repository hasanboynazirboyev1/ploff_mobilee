part of 'backet_bloc.dart';

@immutable
abstract class BacketState {}

class BacketInitial extends BacketState {}

class BacketHomeState extends BacketState {
  num productNum;
  OneProductModel? oneProductModel;

  BacketHomeState({required this.productNum, this.oneProductModel});

  BacketHomeState copyWIth({
    num? productNum,
    OneProductModel? oneProductModel,
  }) {
    return BacketHomeState(
        oneProductModel: oneProductModel ?? this.oneProductModel,
        productNum: productNum ?? this.productNum);
  }
}
