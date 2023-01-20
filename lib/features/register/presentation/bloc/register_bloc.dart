import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/confirm_login_api.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/register_api.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/register_confirm_api.dart';
import 'package:ploff_mobile/features/register/data/datasouse/remote/sign_number.dart';
import 'package:ploff_mobile/features/main_home/presentation/pages/main_home_page.dart';
import 'package:ploff_mobile/features/register/presentation/pages/sign_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    // on<RegisterEvent>((event, emit) {});
    on<RegisterInitialEvent>((event, emit) {
      emit(RegisterHomeState());
    });
    
    on<SignNameEvent>((event, emit) async {
      // final state = this.state as RegisterHomeState;
      
    });
    on<ConfirmLoginEvent>((event, emit) async {
      final state = this.state as RegisterHomeState;
    });
    on<RegisterConfirmEvent>((event, emit) async {});
    on<ExitAccEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isActive', false);
    });
  }
}
