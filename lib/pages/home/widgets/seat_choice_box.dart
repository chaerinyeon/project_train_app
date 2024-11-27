import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/seat/seat_page.dart';

class SeatChoiceBox extends StatelessWidget {
  // 출발역 이름, null 또는 빈 문자열이면 버튼 활셩화
  final String? departureStation; // 출발역 이름, null 또는 빈 문자열이면 버튼 비활성화
  final String? arrivalStation; // 도착역 이름, null 또는 빈 문자열이면 버튼 비활성화

  SeatChoiceBox({
    // 출발역과 도착역을 받아 SeatChoicebox 생성
    required this.departureStation, // 출발역 필수 매개변수
    required this.arrivalStation, // 도착역 필수 매개변수
  });

  @override
  Widget build(BuildContext context) {
    // 출발역과 도착역이 모두 설정되어 있고 빈 문자열이 아닌 경우에만 버튼을 활성화
    bool isEnabled = departureStation != null &&
        arrivalStation != null &&
        departureStation!.isNotEmpty &&
        arrivalStation!.isNotEmpty;

    return SizedBox(
      width: double.infinity, // 버튼을 화면 너비에 맞춰 넓게 만듭니다.
      child: ElevatedButton(
        // 버튼
        style: ElevatedButton.styleFrom(
          // 버튼 스타일
          backgroundColor: Colors.purple, //버튼색 보라색
          shape: RoundedRectangleBorder(
            //버튼 모서리 둥글게
            borderRadius: BorderRadius.circular(20),
          ),
        ), //버튼이 활성화 상태 시에만 onPress 함수 실행
        onPressed: isEnabled
            ? () {
                // 출발역과 도착역이 같은지 확인
                if (departureStation == arrivalStation) {
                  // 출발역과 도착역이 같으면 CupertinoAlertDialog 표시
                  showCupertinoDialog(
                    context: context,
                    builder: (context) => CupertinoAlertDialog(
                      title: Text('오류'),
                      content: Text('출발역과 도착역이 같습니다. 다른 역을 선택해주세요.'),
                      actions: <Widget>[
                        CupertinoDialogAction(
                          child: Text('확인'),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ],
                    ),
                  );
                } else {
                  // 출발역과 도착역이 다르면 SeatPage로 이동
                  print('Departure Station: $departureStation');
                  print('Arrival Station: $arrivalStation');
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SeatPage(
                        departure: departureStation!,
                        arrival: arrivalStation!,
                      ),
                    ),
                  );
                }
              }
            : null, //null 이 아닐 시
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
