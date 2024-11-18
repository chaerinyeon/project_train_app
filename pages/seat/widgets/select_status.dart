import 'package:flutter/material.dart';

class SelectStatus extends StatelessWidget {
  final String? selectedSeat;

  const SelectStatus({this.selectedSeat});


  Widget _buildStatusBox(Color color, String label) {
    return Row(
      children: [
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        SizedBox(width: 4),
        Text(label),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 좌석 상태 표시
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildStatusBox(Colors.purple, '선택됨'),
            SizedBox(width: 20), 
            _buildStatusBox(Colors.grey[300] ?? Colors.grey, '선택안됨'),
          ],
        ),
      ],
    );
  }
}
