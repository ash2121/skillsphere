import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsphere/pages/sign_in/bloc/signin_events.dart';
import 'package:skillsphere/pages/sign_in/bloc/signin_states.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInState()) {
    on<EmailEvent>((event, emit) {});
    on<PasswordEvent>((event, emit) {});
  }
}
