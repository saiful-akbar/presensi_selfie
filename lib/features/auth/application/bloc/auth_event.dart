sealed class AuthEvent {}

// simpan token
class SaveAuthToken extends AuthEvent {
  final String token;

  SaveAuthToken(this.token);
}

// Check auth
class CheckAuth extends AuthEvent {}
