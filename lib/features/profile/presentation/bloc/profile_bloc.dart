import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    // on<ProfileEvent>((event, emit) {

    
    // });
    on<ProfileInitialEvent>((event, emit)async {
       final SharedPreferences prefs = await SharedPreferences.getInstance();
      final name = prefs.getString('name');
      final phone = prefs.getString('phone');
      emit(ProfileHomeState(name: name,phone: phone));
    });
    on<ExitProfileEvent>((event, emit)async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setBool('isActive', false);
    });

  }
}
