import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:meta/meta.dart';
import 'package:ploff_mobile/datasouse/remote/confirm_login_api.dart';
import 'package:ploff_mobile/datasouse/remote/register_api.dart';
import 'package:ploff_mobile/datasouse/remote/register_confirm_api.dart';
import 'package:ploff_mobile/datasouse/remote/sign_number.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) {
      
    });
    on<RegisterInitialEvent>((event, emit) {
      emit(RegisterHomeState());
    });
    on<SignNumberEvent>((event, emit)async {
      final state = this.state as RegisterHomeState;
      await SignnumberApi.signNumber(event.context, state.numberController.text);
    });
    on<SignNameEvent>((event, emit)async {
      final state = this.state as RegisterHomeState;
      await SignNameApi.confirmLogin(name: state.nameController.text,number: state.numberController.text);
    });
    on<RegisterConfirmEvent>((event, emit)async {
      final state = this.state as RegisterHomeState;
      await RegisterConfirmApi.registerConfirm(state.codeController.text, state.numberController.text);
      
      
     
     
     
      
    });
  }
}
