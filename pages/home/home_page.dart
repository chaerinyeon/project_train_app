import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/home/widgets/seat_choice_box.dart';
import 'package:flutter_train_app/pages/home/widgets/station_choie_box.dart';
import 'package:flutter_train_app/pages/station/station_list_page.dart';

class HomePage extends StatefulWidget {
  //StatefulWidget으ㄹ 사용하여 상태 관리
  @override
  _HomePageState createState() => _HomePageState(); //상태 클래스 생성
}

class _HomePageState extends State<HomePage> {
  //HomePage 상태 관리 클래스
  String? departureStation; // 출발역을 저장하는 변수, null 허용
  String? arrivalStation; // 도착역을 저장하는 변수, null 허용

  void selectStation(bool isDeparture) async {
    // 출발역 또는 도착역 선택을 처리하는 동기화 함수
    final selectedStation = await Navigator.push(
      //StationListPage로 이동
      context,
      MaterialPageRoute(
          builder: (context) => StationListPage(
              isDeparture:
                  isDeparture)), // StationListPage를 생성하고 isDeparture 값을 전달
    );
    if (selectedStation != null) {
      // StationListPage에서 역이 선택되었으면.
      setState(() {
        // 상태 업데이트
        if (isDeparture) {
          //isDeparture기 true면 출발역을 업데이트
          departureStation = selectedStation;
        } else {
          //아니면 도착역 업데이트
          arrivalStation = selectedStation;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    //Widget tree 빌드 함수
    final currentDepartureStation = departureStation ?? ''; // 출발역이 null이면 빈 문자열 사용
    final currentArrivalStation = arrivalStation ?? ''; // 도착역이 null이면 빈 문자열 사용

    return Scaffold( // Scaffolld 위젯을 사용하여 앱의 기본 구조를 설명
      backgroundColor: Theme.of(context).brightness == Brightness.dark // 테마 상태
          ? Colors.black // 다크 모드
          : Colors.grey[200], //라이트 모드
      appBar: AppBar( //앱바 설정
        title: Text('기차예매'), //앱바 제목
      ),
      body: Padding( //패딩 추가로 여백 추가
        padding: const EdgeInsets.all(20.0),
        child: Column( // 열 방향향으로 위젯 배치
          mainAxisAlignment: MainAxisAlignment.center, // 위젯 가운데 정렬
          children: [ //위젯 목록
            StationChoiceBox( // 출발역과 도착역 선택박스
              departureStation: departureStation, // 현재 선택된 출발역 전달
              arrivalStation: arrivalStation, // 현재 선택된 도착역 전달
              onSelectDeparture: () => selectStation(true), // 출발역 선택 함수 설정
              onSelectArrival: () => selectStation(false), // 도착역 선택 함수 설정
            ),
            SizedBox(height: 20), // 위젯 사이 간격
            SeatChoiceBox( //좌석 선택 박스 표시
              departureStation: currentDepartureStation, // 현재 선택된 출발역 전달
              arrivalStation: currentArrivalStation, // 현재 선택된 도착역 전달 
            ),
          ],
        ),
      ),
    );
  }
}
