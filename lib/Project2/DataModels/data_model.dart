class UserModel {
  final String name;
  final String phone;
  final String email;
  final String address;
  final int age;
  final String imgeUrl;
  new({
    required this.name,
    required this.phone,
    required this.email,
    required this.address,
    required this.age,
    required this.imgeUrl,
  });
}

class Users {
  final List<UserModel> users;
  Users({required this.users});
  factory Users.fromJson(Map<String, dynamic> json) {
    final List<UserModel> tempList = json["results"]
        .map<UserModel>(
          (user) => UserModel(
            name: "${user["name"]["first"]} ${user["name"]["last"]}",
            phone: user["phone"],
            email: user["email"],
            address: user["location"]["street"]["name"],
            age: user["dob"]["age"],
            imgeUrl: user["picture"]["large"],
          ),
        )
        .toList();
    return Users(users: tempList);
  }
}
