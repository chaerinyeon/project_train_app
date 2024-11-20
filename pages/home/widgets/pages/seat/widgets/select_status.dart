// lib/pages/seat/widgets/select_status.dart

import 'package:flutter/material.dart';

class SelectStatus extends StatelessWidget {
  final List<String> selectedSeats;

  SelectStatus({required this.selectedSeats});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
     
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildSeatStatusBox(
                const Color.fromARGB(255, 228, 224, 224), '예약 가능'),
            SizedBox(width: 16),
            _buildSeatStatusBox(Colors.purple, '선택됨'),
            SizedBox(width: 16),
            _buildSeatStatusBox(Colors.grey, '예약됨'),
          ],
        ),
      ),
    
      if (selectedSeats.isNotEmpty)
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '''선택된 좌석: ${selectedSeats.join(', ')}''',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        )
    ]);
  }

  Widget _buildSeatStatusBox(Color color, String status) {
    return Row(
      children: [
        Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        SizedBox(width: 8),
        Text(
          status,
          style: TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
