import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/station/widgets/station_lst.dart';

class StationListPage extends StatelessWidget {
  final bool isDeparture;

  StationListPage({Key? key, required this.isDeparture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
