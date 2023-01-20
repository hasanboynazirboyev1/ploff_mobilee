part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitia extends HomeState {}

class HomePageState extends HomeState {
  int? index;
  List? tapbarBoleans;
  int? bannerIndex;

  List<BannerEntity>? banner;
  List<ProductEntity>? products;
  // OneProductModel? oneProductModel;

  HomePageState(
      {this.index,
      
      this.tapbarBoleans,
      this.bannerIndex,
      this.banner,
      this.products});
}
