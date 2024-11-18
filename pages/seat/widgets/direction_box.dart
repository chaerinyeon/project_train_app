import 'package:flutter/material.dart';

class DirectionBox extends StatelessWidget {
  final String departure;
  final String arrival;

  DirectionBox({required this.departure, required this.arrival});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          departure,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
        SizedBox(width: 10),
        Icon(
          Icons.arrow_circle_right_outlined,
          size: 30,
        ),
        SizedBox(width: 10),
        Text(
          arrival,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.purple,
            fontSize: 30,
          ),
        ),
      ],
    );
  }
}
