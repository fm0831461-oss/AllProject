import 'package:flutter/foundation.dart';
import 'package:project1/Project1/data_model/prayer_model.dart';
import 'package:project1/Project1/services/prayer_services.dart';

class PrayersProvider extends ChangeNotifier {
  PrayerModel? prayerTimes;
  Future<void> requestPrayers() async {
    prayerTimes = await PrayerServices.getPrayers();
    notifyListeners();
  }
}
