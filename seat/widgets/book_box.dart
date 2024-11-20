// lib/pages/seat/widgets/book_box.dart

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_train_app/pages/home/home_page.dart';

class BookBox extends StatelessWidget {
  final List<String> selectedSeats;
  final String departure;
  final String arrival;
  final VoidCallback onBook;

  BookBox({
    required this.selectedSeats,
    required this.departure,
    required this.arrival,
    required this.onBook,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: ElevatedButton(
        onPressed: selectedSeats.isEmpty
            ? null
            : () {
                showCupertinoDialog(
                  context: context,
                  builder: (context) => CupertinoAlertDialog(
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
                          onBook(); // onBook 콜백을 제대로 호출
                          Navigator.pop(context);
                          Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
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
