import 'package:flutter/material.dart';
import 'package:flutter_application_1/pages/home/widgets/station_colum.dart';

class StationChoiceBox extends StatelessWidget {
  // 출발역, 도착역, 각 역 선택 시 실행할 콜백함수를 받아 StationChoiceBox 생성
  final String? departureStation;
  final String? arrivalStation;
  final VoidCallback onSelectDeparture;
  final VoidCallback onSelectArrival;

  StationChoiceBox({
    required this.departureStation,
    required this.arrivalStation,
    required this.onSelectDeparture,
    required this.onSelectArrival,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Theme.of(context).brightness == Brightness.dark
            ? const Color.fromARGB(35, 158, 158, 158) // 다크 모드일 때
            : Colors.white, // 라이트 모드일 때
        borderRadius: BorderRadius.circular(20), //모서리 둥글게
      ),
      child: Stack(
        //출발역, 도착역 , 중간선 중첩
        alignment: Alignment.center,
        children: [
          Row(
            // 출발역과 도착역 배치
            children: [
              Expanded(
                // 화면 공간을 두 컬럼에 동일하게 분배
                child: StationColumnWidget(
                  title: '출발역',
                  station: departureStation, //선택된 출발역
                  onTap: onSelectDeparture, //선택 시 실행 함수
                ),
              ),
              Expanded(
                // 화면 공간을 두 컬럼에 동일하게 분배
                child: StationColumnWidget(
                  title: '도착역',
                  station: arrivalStation, //선택된 도착역
                  onTap: onSelectArrival, // 선택 시 실행 함수
                ),
              ),
            ],
          ),
          Container(
            //출발역과 도착역 사이에 구분선
            width: 2,
            height: 50,
            color: Colors.grey[400],
          ),
        ],
      ),
    );
  }
}
