import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/presentation/screens/home/home_page.dart';
import 'package:ploff_mobile/presentation/screens/profile/profile_page.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {
      
    });
    on<ActiveIndexEvent>((event, emit) {
      emit(MainHomeState(event.index!));
    });
    on<MainInititalEvent>((event, emit) {
      emit(MainHomeState(0));
    });
   
  }
}
