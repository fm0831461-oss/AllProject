class DataModel {
  final String name;
  final String email;
  final String imgeUrl;
  final String address;

  DataModel({
    required this.name,
    required this.email,
    required this.imgeUrl,
    required this.address,
  });
}

class user {
  final List<DataModel> users;

  user({required this.users});
  factory user.fromJson(Map<String, dynamic> json) {
    final tempList = json["results"]
        .map<DataModel>(
          (item) => DataModel(
            name: "${item["name"]["first"]} ${item["name"]["last"]}",
            email: item["email"],
            imgeUrl: item["picture"]["large"],
            address: item["location"]["street"]["name"],
          ),
        )
        .toList();
    return user(users: tempList);
  }
}
