part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}
class HomeInitialEvent extends HomeEvent{}
class TapbarIndexEvent extends HomeEvent{
  int? index;
  TapbarIndexEvent(this.index);
}
class BannerIndexEvent extends HomeEvent{
  int bannerIndex;
  BannerIndexEvent(this.bannerIndex);
}
class TapProductIndexEvent extends HomeEvent{
  int tapProductIndex;
  TapProductIndexEvent(this.tapProductIndex);
}
 class OpenHiveEvent extends HomeEvent{}

