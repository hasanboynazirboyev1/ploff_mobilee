part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitia extends HomeState {
 
}
class HomePageState extends HomeState{
   int? index;
   List? tapbarBoleans;
   int? bannerIndex;
   BannersModel? banner;
   ProductModel? products;
  HomePageState({this.index,this.tapbarBoleans,this.bannerIndex,this.banner,this.products});
}