sealed class AuthState {
  final String? token;

  AuthState({this.token});
}

// Initial State
class AuthInitial extends AuthState {}

// Auth value
class AuthValue extends AuthState {
  AuthValue({super.token});
}
