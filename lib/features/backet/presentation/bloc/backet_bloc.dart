import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/backet/data/models/product_model.dart';

part 'backet_event.dart';
part 'backet_state.dart';

class BacketBloc extends Bloc<BacketEvent, BacketState> {
  BacketBloc() : super(BacketInitial()) {
    on<BacketEvent>((event, emit) {
      
    });
    on<BacketIniitialEvent>((event, emit)async {
      await Hive.openBox('productDb');
      emit(BacketHomeState());
    });
    on<OneProductEvent>((event, emit) {
      emit(BacketHomeState());
    });
  }
}
