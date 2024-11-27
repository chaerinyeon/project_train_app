import 'package:flutter/material.dart';

class StationColumnWidget extends StatelessWidget {
  final String title;
  final String? station;
  final VoidCallback onTap;

  StationColumnWidget({ //전체 제목, 역이름, 탭 콜백함수를 받아 생성
    required this.title,
    required this.station,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center, //수직으로 가운데 정렬
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10), //간격
        GestureDetector(
          onTap: onTap, // 탬했을 때 onTap함수 호출
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
