import 'package:flutter/foundation.dart';

class PrayerModel {
  Map<String, dynamic> prayermModel;
  PrayerModel({required this.prayermModel});
  factory PrayerModel.FromJson(Map<String, dynamic> json) {
    return PrayerModel(prayermModel: json["data"]["timings"]);
  }
}
