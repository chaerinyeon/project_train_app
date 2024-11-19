import 'package:flutter/material.dart';

class StationColumnWidget extends StatelessWidget {
  final String title;
  final String? station;
  final VoidCallback onTap;

  StationColumnWidget({
    required this.title,
    required this.station,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: onTap,
          child: Text(
            station ?? '선택',
            style: TextStyle(
              fontSize: 40,
            ),
          ),
        ),
      ],
    );
  }
}
