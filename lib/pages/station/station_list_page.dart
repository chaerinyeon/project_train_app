// ignore_for_file: prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/station/widgets/station_list.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;

  StationListPage({super.key, required this.isDeparture});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isDeparture ? '출발역' : '도착역'),
      ),
      body: ListView.builder(
        itemCount: StationList.stations.length,
        itemBuilder: (context, index) {
          return StationListItem(station: StationList.stations[index]);
        },
      ),
    );
  }
}
