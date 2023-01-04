import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/datasouse/models/banner_model.dart';
import 'package:ploff_mobile/datasouse/models/product_model.dart';
import 'package:ploff_mobile/datasouse/remote/banner_api.dart';
import 'package:ploff_mobile/datasouse/remote/product_api.dart';
import 'package:ploff_mobile/presentation/blocs/main_bloc/main_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitia()) {
    on<HomeEvent>((event, emit) {
      
    });
    on<HomeInitialEvent>((event, emit) async{
      final banner = await BannersApi.getBanners();
      final products = await ProductApi.getProducts();

      emit(HomePageState(tapbarBoleans: List.generate(4, (index) => false),bannerIndex: 0,banner: banner,products: products));
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
