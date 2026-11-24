class AuthModel {
  final bool status;
  final String message;

  AuthModel({required this.status, required this.message});
  factory AuthModel.fromhjson(Map<String, dynamic> json) {
    return AuthModel(status: json["status"], message: json["message"]);
  }
}
