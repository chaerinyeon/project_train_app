import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/seat_choice_box.dart';
import 'package:flutter_train_app/pages/home/widgets/station_choie_box.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? departureStation;
  String? arrivalStation;

  get viewPurchasedTickets => null;

  void selectStation(bool isDeparture) async {
    final selectedStation = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => StationListPage(isDeparture: isDeparture)),
    );
    if (selectedStation != null) {
      setState(() {
        if (isDeparture) {
          departureStation = selectedStation;
        } else {
          arrivalStation = selectedStation;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentDepartureStation = departureStation ?? '';
    final currentArrivalStation = arrivalStation ?? '';

    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.black // 다크 모드
          : Colors.grey[200],
      appBar: AppBar(
        title: Text('기차예매'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StationChoiceBox(
              departureStation: departureStation,
              arrivalStation: arrivalStation,
              onSelectDeparture: () => selectStation(true),
              onSelectArrival: () => selectStation(false),
            ),
            SizedBox(height: 20),
            SeatChoiceBox(
              departureStation: currentDepartureStation,
              arrivalStation: currentArrivalStation,
            ),
          ],
        ),
      ),
    );
  }
}
