import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/design_order/data/repository/design_order_api.dart';
import 'package:ploff_mobile/features/home/presentation/pages/home_page.dart';
import 'package:ploff_mobile/features/profile/presentation/pages/profile_page.dart';
import 'package:ploff_mobile/features/register/presentation/bloc/register_bloc.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(MainInitial()) {
    on<MainEvent>((event, emit) {});
    on<ActiveIndexEvent>((event, emit) async {
      final state = this.state as MainHomeState;
      SharedPreferences getIsActive = await SharedPreferences.getInstance();
      state.isActive = (getIsActive.getBool('isActive') ?? false);

      if (event.index == 3 || event.index == 2 || event.index == 1) {
        if (state.isActive == false) {
          Navigator.pushNamed(event.context!, 'signnumber');
        }
      }
     

      emit(MainHomeState(
        activeIndex: event.index,
      ));
    });
    on<MainInititalEvent>((event, emit) async {
      await Hive.openBox('productDb');

      emit(MainHomeState(
        activeIndex: 0,
      ));
    });
    on<ThrowfirstPageEvent>((event, emit) {
      emit(MainHomeState(activeIndex: 0));
    });
    on<Throw3pageEvent>((event, emit) async {
      try {
        await DesigOrderApi.getOrder();
      } catch (e) {}
      emit(MainHomeState(activeIndex: 2));
    });
  }
}
