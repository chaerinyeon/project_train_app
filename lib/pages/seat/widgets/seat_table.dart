// lib/pages/seat/widgets/seat_table.dart

import 'package:flutter/material.dart';

class SeatTable extends StatelessWidget {
  final List<String> selectedSeats; //현재 선택된 좌석 목록.
  final List<String> bookedSeats; // 이미 예약된 좌석 목록
  final Function(String) onSeatSelected; //좌석 선택 시 호출되는 함수

  SeatTable({
    required this.selectedSeats,
    required this.bookedSeats,
    required this.onSeatSelected,
    required List selectedSeat,
  });

  @override
  Widget build(BuildContext context) {
    final seatColumns = ['A', 'B', 'C', 'D']; // 좌석 열 레이블
    const totalRows = 20; // 좌석의 행 수

    return ListView.builder(
      itemCount: totalRows + 1, // 헹 + 열 레이블 행
      itemBuilder: (context, index) {
        if (index == 0) {
          // 좌석 레이블 행
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, //가운데 정렬
              children: [
                // 열 레이블들을 2개씩 나눠서 생성
                ...seatColumns.sublist(0, 2).map((column) {
                  return _buildLabel(column);
                }),
                const SizedBox(
                  width: 50,
                  height: 30,
                ), // 좌석 번호 열을 위한 공간
                ...seatColumns.sublist(2).map((column) {
                  return _buildLabel(column);
                }),
              ],
            ),
          );
        } else {
          // 좌석 행
          int rowIndex = index;
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // 가운데 정렬
              children: [
                // 왼쪽 좌석 (A, B)
                ...seatColumns.sublist(0, 2).map((column) {
                  String seatId = '$rowIndex-$column'; //좌석 ID 생성
                  return _buildSeat(seatId);
                }),
                // 좌석 번호 셀
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$rowIndex', // 행 번호 표시

                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                // 오른쪽 좌석 (C, D)
                ...seatColumns.sublist(2).map((column) {
                  String seatId = '$rowIndex-$column'; //좌석 ID 생성
                  return _buildSeat(seatId);
                }),
              ],
            ),
          );
        }
      },
    );
  }

  Widget _buildLabel(String label) {
    // 좌석 열 레이블을 생성
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2), //좌우여백
      width: 50,
      height: 30,
      alignment: Alignment.center, //가운데 정렬
      child: Text(
        label, //열 레이블
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSeat(String seatId) {
    //좌석 생성
    final isSelected = selectedSeats.contains(seatId); //선택된 좌석 여부 확인
    final isBooked = bookedSeats.contains(seatId); //예약된 좌석 여부 확인

    return GestureDetector(
      //예약된 좌석 탭 불가능
      onTap: isBooked
          ? null
          : () {
              onSeatSelected(seatId); //좌석 선택 콜백 함수
            },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 2), //좌우 여백
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isBooked
              ? Colors.grey //예약된 좌석의 색
              : (isSelected
                  ? Colors.purple // 선택된 좌석의 색
                  : const Color.fromARGB(255, 228, 224, 224)), //기본 색상
          borderRadius: BorderRadius.circular(8), //모서리 둥글게
          border: Border.all(
            color: Colors.black, //테두리
            width: 1,
          ),
        ),
      ),
    );
  }
}
