import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/backet/data/datasourse/remote/product_api.dart';
import 'package:ploff_mobile/features/backet/data/models/product_model.dart';

part 'backet_event.dart';
part 'backet_state.dart';

class BacketBloc extends Bloc<BacketEvent, BacketState> {
  BacketBloc() : super(BacketInitial()) {
    // on<BacketEvent>((event, emit) {});
    on<BacketIniitialEvent>((event, emit) async {
      
      var productHiveDb = Hive.box('productDb');

      final data = productHiveDb.keys.map((key) {
        final item = productHiveDb.get(key);
        return {
          "key": key,
          "title": item["title"],
          "outPrice": item["outPrice"]
        };
      }).toList();
      final  items;

      items = data.reversed.toList();
      emit(BacketHomeState(productsItem: items));
    });
    // on<OneProductEvent>((event, emit) {
    //   emit(BacketHomeState());
    // });
  }
}
