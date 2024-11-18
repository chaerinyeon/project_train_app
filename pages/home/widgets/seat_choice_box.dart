import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/seat_page.dart';

class SeatChoiceBox extends StatelessWidget {
  final String? departureStation;
  final String? arrivalStation;

  SeatChoiceBox({
    required this.departureStation,
    required this.arrivalStation,
  });

  @override
  Widget build(BuildContext context) {
    bool isEnabled = departureStation != null &&
        arrivalStation != null &&
        departureStation!.isNotEmpty &&
        arrivalStation!.isNotEmpty;

    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: isEnabled ? Colors.purple : Colors.grey, 
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
       
        onPressed: isEnabled
            ? () {
                print('Departure Station: $departureStation');
                print('Arrival Station: $arrivalStation');
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SeatPage(
                        departure: departureStation!,
                        arrival: arrivalStation!,
                      );
                    },
                  ),
                );
              }
            : null, 
        child: Text(
          '좌석 선택',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
