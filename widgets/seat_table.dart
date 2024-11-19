// lib/pages/seat/widgets/seat_table.dart

import 'package:flutter/material.dart';

class SeatTable extends StatelessWidget {
  final List<String> selectedSeats;
  final List<String> bookedSeats;
  final Function(String) onSeatSelected;

  SeatTable({
    required this.selectedSeats,
    required this.bookedSeats,
    required this.onSeatSelected,
    required List selectedSeat,
  });

  @override
  Widget build(BuildContext context) {
    final seatColumns = ['A', 'B', 'C', 'D'];
    final totalRows = 20; // 원하는 행 수

    return ListView.builder(
      itemCount: totalRows + 1, // 20행 + 레이블 행
      itemBuilder: (context, index) {
        if (index == 0) {
          // 좌석 레이블 행
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...seatColumns.sublist(0, 2).map((column) {
                  return _buildLabel(column);
                }),
                SizedBox(
                  width: 50,
                  height: 30,
                ),
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // 왼쪽 좌석 (A, B)
                ...seatColumns.sublist(0, 2).map((column) {
                  String seatId = '$rowIndex-$column';
                  return _buildSeat(seatId);
                }),
                // 좌석 번호 셀
                Container(
                  width: 50,
                  height: 50,
                  alignment: Alignment.center,
                  child: Text(
                    '$rowIndex',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                // 오른쪽 좌석 (C, D)
                ...seatColumns.sublist(2).map((column) {
                  String seatId = '$rowIndex-$column';
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
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2),
      width: 50,
      height: 30,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _buildSeat(String seatId) {
    final isSelected = selectedSeats.contains(seatId);
    final isBooked = bookedSeats.contains(seatId);

    return GestureDetector(
      onTap: isBooked
          ? null
          : () {
              onSeatSelected(seatId);
            },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 2),
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          color: isBooked
              ? Colors.grey
              : (isSelected
                  ? Colors.purple
                  : const Color.fromARGB(255, 228, 224, 224)),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: Colors.black,
            width: 1,
          ),
        ),
      ),
    );
  }
}
