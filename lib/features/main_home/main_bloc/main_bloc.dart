import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
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

      if (event.index == 3) {
        if (state.isActive == false) {
          Navigator.push(
              event.context!,
              MaterialPageRoute(
                  builder: ((context) => BlocProvider(
                        create: (context) => RegisterBloc(),
                        child: const SignNumberPage(),
                      ))));
        }
      }
      emit(MainHomeState(
        activeIndex: event.index,
      ));
    });
    on<MainInititalEvent>((event, emit) async {
      emit(MainHomeState(
        activeIndex: 0,
      ));
    });
  }
}