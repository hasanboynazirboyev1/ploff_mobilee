part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitia extends HomeState {}

class HomePageState extends HomeState {
  int? index;
  List? tapbarBoleans;
  int? bannerIndex;

  List<BannerEntity>? banner;
  // List<ProductEntity>? products;
  ProductModel? products;

  HomePageState(
      {this.index,
      this.tapbarBoleans,
      this.bannerIndex,
      this.banner,
      this.products});
  HomePageState copyWIth({
    int? index,
    int? productNum,
    List? tapbarBoleans,
    int? bannerIndex,
    List<BannerEntity>? banner,
    // List<ProductEntity>? products,
    ProductModel? products,
  }) {
    return HomePageState(
      index: index ?? this.index,
      tapbarBoleans: tapbarBoleans ?? this.tapbarBoleans,
      bannerIndex: bannerIndex ?? this.bannerIndex,
      banner: banner ?? this.banner,
      products: products ?? this.products,
    );
  }
}
