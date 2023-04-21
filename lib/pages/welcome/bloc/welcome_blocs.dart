import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsphere/pages/welcome/bloc/welcome_events.dart';
import 'package:skillsphere/pages/welcome/bloc/welcome_states.dart';

class WelcomeBloc extends Bloc<WelcomeEvent, WelcomeState> {
  // calling constructor of class and superclass - bloc
  WelcomeBloc() : super(WelcomeState()) {
    on<WelcomeEvent>((event, emit) {
      // whenever we call this event, we'll have a value state.page value and we'll emit a value
      emit(WelcomeState(page: state.page));
    });
  }
}
