import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/book_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/direction_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_table.dart';
import 'package:flutter_train_app/pages/seat/widgets/select_status.dart';

class SeatPage extends StatefulWidget {
  final String departure;
  final String arrival;

  SeatPage({required this.departure, required this.arrival});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> {
  String? selectedSeat;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                DirectionBox(
                  departure: widget.departure,
                  arrival: widget.arrival,
                ),
                SizedBox(height: 20),
                SelectStatus(selectedSeat: selectedSeat),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SeatTable(
              selectedSeat: selectedSeat,
              onSeatSelected: (seatId) {
                setState(() {
                  selectedSeat = seatId;
                });
              },
            ),
          ),
          BookBox(
            selectedSeat: selectedSeat,
            departure: widget.departure,
            arrival: widget.arrival,
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
