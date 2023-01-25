import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/remote/one_product_api.dart';

import '../../../home/data/models/one_product_model.dart';
import '../../data/datasourse/local/hive/hive_boxses.dart';
import '../../data/datasourse/local/hive/hive_model.dart';

part 'backet_event.dart';
part 'backet_state.dart';

class BacketBloc extends Bloc<BacketEvent, BacketState> {
  BacketBloc() : super(BacketInitial()) {
    // on<BacketEvent>((event, emit) {});
    on<BacketIniitialEvent>((event, emit) async {
      
      emit(BacketHomeState(productNum: 1));
    });
    on<OneProductEvent>((event, emit) async {
      final oneProd = await OneProductApi.getOneProduct(event.id!);
      emit(BacketHomeState(productNum: 1, oneProductModel: oneProd));
    });
    on<DecrementNumEvent>((event, emit) async {
      final state = this.state as BacketHomeState;
      if (state.productNum > 1) {
        emit(state.copyWIth(productNum: state.productNum - 1));
      }
    });
    on<IncrementNumEvent>((event, emit) async {
      final state = this.state as BacketHomeState;
      emit(state.copyWIth(productNum: state.productNum + 1));
    });
    on<ClearBoxEvent>((event, emit) async {
      final state = this.state as BacketHomeState;
      await HiveBoxses.getData().clear();
      emit(state.copyWIth());
    });
  }
}
