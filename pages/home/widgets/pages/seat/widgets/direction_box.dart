import 'package:flutter/material.dart';

class DirectionBox extends StatelessWidget {
  final String departure;
  final String arrival;

  DirectionBox({required this.departure, required this.arrival});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Center(
            child: Text(
              departure,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
          ),
        ),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        Expanded(
          child: Center(
            child: Text(
              arrival,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.purple,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
