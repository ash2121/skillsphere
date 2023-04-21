class SignInState {
  final String email;
  final String password;

  SignInState({
    this.email = "",
    this.password = "",
  });

  SignInState copyWith({String? email, String? password}) {
    return SignInState(
      // if email has a value then use it else use whatever value was there in the state before
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
