// lib/pages/seat/widgets/book_box.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/pages/home/home_page.dart';

class BookBox extends StatelessWidget {
  final List<String> selectedSeats;
  final String departure;
  final String arrival;
  final VoidCallback onBook; //예약버튼 누를 시 실행될 콜백 함수

  BookBox({
    required this.selectedSeats,
    required this.departure,
    required this.arrival,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20), //좌우패딩
      child: ElevatedButton(
        onPressed: selectedSeats.isEmpty //선택된 좌석이 없으면 버튼 비활성화
            ? null
            : () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
                    // CupertinoAlertDialog를 사용하여 예약 확인 다이얼로그 표시
                    title: Text('예약 확인'),
                    content:
                        Text('좌석 ${selectedSeats.join(', ')} 을(를) 예약하시겠습니까?'),
                    actions: [
                      CupertinoDialogAction(
                        child: Text('취소'),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      CupertinoDialogAction(
                        child: Text('확인'),
                        onPressed: () {
                          onBook(); // 예약 콜백 함수 호출 (실제 예약 로직 처리)
                          Navigator.pop(context); // 닫기
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) =>
                                  HomePage(), //HomePage이동 후 기존 경로 제거
                            ),
                            (route) => false,
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: Colors.purple,
          minimumSize: Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Text(
          '예약하기',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
