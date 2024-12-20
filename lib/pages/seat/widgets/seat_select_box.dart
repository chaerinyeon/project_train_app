import 'package:flutter/material.dart';

class SeatSelectBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildSeatStatusBox(Colors.grey[200]!, '선택안됨'),
        SizedBox(width: 8),
        _buildSeatStatusBox(Colors.purple, '선택됨')
      ],
    );
  }

  Widget _buildSeatStatusBox(Color color, String text) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
        ),
        SizedBox(width: 4),
        Text(text),
      ],
    );
  }
}
