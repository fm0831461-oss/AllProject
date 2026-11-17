class AuthModel {
  final String? username;
  final String? password;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? accessToken;
  final String? refreshToken;

  AuthModel({
    this.username,
    this.password,
    this.firstName,
    this.lastName,
    this.email,
    this.accessToken,
    this.refreshToken,
  });
}

class Auth {
  final AuthModel user;

  Auth({required this.user});

  factory Auth.fromJson(Map<String, dynamic> json) {
    return Auth(
      user: AuthModel(
        username: json['username'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        accessToken: json['accessToken'],
        refreshToken: json['refreshToken'],
      ),
    );
  }
}
