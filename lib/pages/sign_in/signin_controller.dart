import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skillsphere/pages/sign_in/bloc/signin_blocs.dart';

class SignInController {
  final BuildContext context;

  SignInController({required this.context});
// what kind of login : using social handles or login
  Future<void> handleSignIn(String type) async {
    try {
      if (type == "email") {
        // BlocProvider.of<SignInBloc>(context);
        final state = context.read<SignInBloc>().state;
        String emailAddress = state.email;
        String password = state.password;
        if (emailAddress.isEmpty) {}
        if (password.isEmpty) {}
        // to check if the user exists or not in the db
        // network issues should be inside try and catch calls
        try {
          final credential = await FirebaseAuth.instance
              .signInWithEmailAndPassword(
                  email: emailAddress, password: password);
          if (credential.user == null) {
            //
          }
          if (!credential.user!.emailVerified) {
            //
          }
          var user = credential.user;
          if (user != null) {
            // we have got verified user
          } else {
            // error getting user from firebase
          }
        } catch (e) {}
      }
    } catch (e) {}
  }
}
