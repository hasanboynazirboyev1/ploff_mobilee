import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/one_product_api.dart';
import 'package:ploff_mobile/features/home/data/models/banner_model.dart';
import 'package:ploff_mobile/features/home/data/models/product_model.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/banner_api.dart';
import 'package:ploff_mobile/features/home/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/home/data/repository/banner_repo.dart';
import 'package:ploff_mobile/features/home/data/repository/product_repo.dart';
import 'package:ploff_mobile/features/home/domain/entitity/banner_entity.dart';
import 'package:ploff_mobile/features/home/domain/entitity/product_entity.dart';
import 'package:ploff_mobile/features/home/domain/usecase/banner_usecase.dart';
import 'package:ploff_mobile/features/home/domain/usecase/product_usecase.dart';

import '../../data/models/one_product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitia()) {
    on<HomeEvent>((event, emit) {});
    on<HomeInitialEvent>((event, emit) async {
      final banners = await BannerUseCase(repo: BannerRepo()).call(1);
      final product = await ProductUsecase(repo: ProductRepo()).call(1);
      print(
          "${product[1].active} *************************************************");

      emit(HomePageState(
          tapbarBoleans: List.generate(4, (index) => false),
          bannerIndex: 0,
          banner: banners,
          products: product));
    });
    on<TapbarIndexEvent>((event, emit) {
      final state = this.state as HomePageState;
      state.tapbarBoleans![event.index!] = !state.tapbarBoleans![event.index!];
      emit(HomePageState(
          tapbarBoleans: state.tapbarBoleans,
          bannerIndex: state.bannerIndex,
          banner: state.banner,
          products: state.products));
    });
    on<BannerIndexEvent>((event, emit) {
      final state = this.state as HomePageState;
      emit(HomePageState(
          bannerIndex: event.bannerIndex,
          tapbarBoleans: state.tapbarBoleans,
          banner: state.banner,
          products: state.products));
    });
  
  }
}
