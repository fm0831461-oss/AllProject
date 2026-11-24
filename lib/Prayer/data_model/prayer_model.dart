class PrayerModel {
  Map<String, dynamic> prayermModel;
  PrayerModel({required this.prayermModel});
  factory PrayerModel.fromJson(Map<String, dynamic> json) {
    return PrayerModel(prayermModel: json["data"]["timings"]);
  }
}
