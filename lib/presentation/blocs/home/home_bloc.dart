import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/data/models/banner_model.dart';
import 'package:ploff_mobile/data/models/product_model.dart';
import 'package:ploff_mobile/data/datasouse/remote/banner_api.dart';
import 'package:ploff_mobile/data/datasouse/remote/product_api.dart';
import 'package:ploff_mobile/data/repository/banner_repo.dart';
import 'package:ploff_mobile/data/repository/product_repo.dart';
import 'package:ploff_mobile/domain/entites/banner_entity.dart';
import 'package:ploff_mobile/domain/entites/product_entity.dart';
import 'package:ploff_mobile/domain/usecase/banner_usecase.dart';
import 'package:ploff_mobile/domain/usecase/product_usecase.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitia()) {
    on<HomeEvent>((event, emit) {
      
    });
    on<HomeInitialEvent>((event, emit) async{
      // final banner = await BannersApi.getBanners();
      // final products = await ProductApi.getProducts();
      
      final banners = await BannerUseCase(repo: BannerRepo()).call(1);
      final product = await ProductUsecase(repo: ProductRepo()).call(1);
      print("${product[1].active} *************************************************");

      emit(HomePageState(tapbarBoleans: List.generate(4, (index) => false),bannerIndex: 0,banner: banners,products: product));
    });
    on<TapbarIndexEvent>((event, emit) {
      final state = this.state as HomePageState;
      state.tapbarBoleans![event.index!] = !state.tapbarBoleans![event.index!];
      emit(HomePageState(tapbarBoleans: state.tapbarBoleans,bannerIndex: state.bannerIndex,banner: state.banner,products: state.products));
      
    });
    on<BannerIndexEvent>((event, emit) {
      final state = this.state as HomePageState;
      emit(HomePageState(bannerIndex: event.bannerIndex,tapbarBoleans: state.tapbarBoleans,banner: state.banner,products: state.products));
    });
  }
}
