class WeAuthModel {
  final bool status;
  final String message;

  new({required this.status, required this.message});
  factory WeAuthModel.fromJson(Map<String, dynamic> json) {
    return WeAuthModel(status: json["status"], message: json["message"]);
  }
}
