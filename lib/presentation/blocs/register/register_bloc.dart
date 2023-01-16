import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/data/datasouse/remote/confirm_login_api.dart';
import 'package:ploff_mobile/data/datasouse/remote/register_api.dart';
import 'package:ploff_mobile/data/datasouse/remote/register_confirm_api.dart';
import 'package:ploff_mobile/data/datasouse/remote/sign_number.dart';
import 'package:ploff_mobile/presentation/screens/home/main_home_page.dart';
import 'package:ploff_mobile/presentation/screens/register/sign_number_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {});
    on<RegisterInitialEvent>((event, emit) {
      emit(RegisterHomeState());
    });
    on<SignNumberEvent>((event, emit) async {
      final state = this.state as RegisterHomeState;
      await SignnumberApi.signNumber(
          event.context, state.numberController.text);
    });
    on<SignNameEvent>((event, emit) async {
      final state = this.state as RegisterHomeState;
      await SignNameApi.registerName(event.context,
          name: state.nameController.text, number: state.numberController.text);
    });
    on<ConfirmLoginEvent>((event, emit) async {
      final state = this.state as RegisterHomeState;
      await ConfirmLoginApi.confirmLogin(event.context,
          code: state.codeController.text,
          number: state.numberController.text,
          token:
              'c5QOfICbQQyc17uiUUi9Ae:APA91bHErn_4T5Ucv8R8xlXsPk7gSjonKEBgfjJU2WDo6lZRl-6VIL_P_TWATqmv_9T-ItIOtZO7HEeq1juOZVQSxgaKzN2E46TQKj53r3bXqcUBEvjLMXs3EAW4vUbnSVNx-8fjxAlt');
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isActive', true);
      Navigator.pushAndRemoveUntil(
          event.context!,
          MaterialPageRoute(builder: ((context) => const MainHomePage())),
          (route) => false);
         
    });
    on<RegisterConfirmEvent>((event, emit) async {
      final state = this.state as RegisterHomeState;
      await RegisterConfirmApi.registerConfirm(event.context,
          code: state.codeController.text, number: state.numberController.text);
      SharedPreferences setBoolean = await SharedPreferences.getInstance();
      await setBoolean.setBool('isActive', true);
    });
    on<ExitAccEvent>((event, emit) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isActive', false);

    });
  }
}
