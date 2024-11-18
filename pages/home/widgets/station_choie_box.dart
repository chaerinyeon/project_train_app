import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/station_column.dart';

class StationChoiceBox extends StatelessWidget {
  final String? departureStation;
  final String? arrivalStation;
  final VoidCallback onSelectDeparture;
  final VoidCallback onSelectArrival;

  StationChoiceBox({
    required this.departureStation,
    required this.arrivalStation,
    required this.onSelectDeparture,
    required this.onSelectArrival,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StationColumnWidget(
            title: '출발역',
            station: departureStation,
            onTap: onSelectDeparture,
          ),
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
          StationColumnWidget(
            title: '도착역',
            station: arrivalStation,
            onTap: onSelectArrival,
          ),
        ],
      ),
    );
  }
}
