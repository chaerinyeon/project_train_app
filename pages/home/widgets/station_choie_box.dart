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
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(35, 158, 158, 158) // 다크 모드
            : Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: [
              Expanded(
                child: StationColumnWidget(
                  title: '출발역',
                  station: departureStation,
                  onTap: onSelectDeparture,
                ),
              ),
              Expanded(
                child: StationColumnWidget(
                  title: '도착역',
                  station: arrivalStation,
                  onTap: onSelectArrival,
                ),
              ),
            ],
          ),
          Container(
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
