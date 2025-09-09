class LoginDTO {
  final String username;
  final String password;

  LoginDTO({required this.username, required this.password});

  // Format ke dalam bentuk json
  Map<String, dynamic> toJson() {
    return {"username": username, "password": password};
  }
}
