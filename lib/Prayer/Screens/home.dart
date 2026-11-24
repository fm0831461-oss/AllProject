import 'package:flutter/material.dart';
import 'package:project1/Prayer/Providers/prayers_provider.dart';
import 'package:project1/Prayer/Widgets/customlist.dart';

import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.lightBlueAccent),
      body: Consumer<PrayersProvider>(
        builder: (context, value, child) {
          final data = value.prayerTimes?.prayermModel;
          if (data == null) {
            value.requestPrayers();
            return Center(child: CircularProgressIndicator());
          } else {
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) => Customlist(
                name: data.keys.elementAt(index),
                time: data.values.elementAt(index),
              ),
            );
          }
        },
      ),
    );
  }
}
