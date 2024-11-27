// lib/pages/seat/seat_page.dart

import 'package:flutter/material.dart';
import 'package:flutter_train_app/pages/seat/widgets/book_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/direction_box.dart';
import 'package:flutter_train_app/pages/seat/widgets/seat_table.dart';
import 'package:flutter_train_app/pages/seat/widgets/select_status.dart';
import 'package:flutter_train_app/pages/seat/widgets/book_seats.dart';

class SeatPage extends StatefulWidget {
  final String departure; //출발역
  final String arrival; //도착역

  SeatPage({required this.departure, required this.arrival});

  @override
  _SeatPageState createState() => _SeatPageState();
}

class _SeatPageState extends State<SeatPage> { 
  List<String> selectedSeats = []; //사용자가 선택한 좌석
  List<String> bookedSeats = []; //이미 예약된 좌석

  @override
  void initState() {
    super.initState();
    _loadBookedSeats(); //예약된 좌석 정보 로드
  }

  Future<void> _loadBookedSeats() async {
    List<String> seats = //예약된 좌석 정보 bookSeats에 저장
        await BookSeats.getBookedSeats(widget.departure, widget.arrival);
    setState(() {
      bookedSeats = seats;
    });
  }


  void _toggleSeatSelection(String seatId) {
    setState(() {
      if (selectedSeats.contains(seatId)) {
        selectedSeats.remove(seatId); //선택된 좌석은 목록 제거
      } else {
        selectedSeats.add(seatId); //선택 안됐으면 목록 추가
      }
    });
  }

  Future<void> _bookSeats() async {
    if (selectedSeats.isEmpty) return;

    List<String> seatsToBook = List.from(selectedSeats);  //선택된 좌석 복사

    await BookSeats.bookSeats(widget.departure, widget.arrival, seatsToBook);

    setState(() {
      bookedSeats.addAll(seatsToBook);
      selectedSeats.clear(); 
    });

    ScaffoldMessenger.of(context).showSnackBar( 
      SnackBar(content: Text('좌석이 예매되었습니다: ${seatsToBook.join(', ')}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('좌석 선택'),
      ),
      body: Column(
        children: [
          SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                DirectionBox(
                  departure: widget.departure,
                  arrival: widget.arrival,
                ),
                SizedBox(height: 20),
                SelectStatus(selectedSeats: selectedSeats),
                SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: SeatTable(
                selectedSeats: selectedSeats,
                bookedSeats: bookedSeats,
                onSeatSelected: (seatId) {
                  _toggleSeatSelection(seatId);
                },
                selectedSeat: []),
          ),
          BookBox(
            selectedSeats: selectedSeats,
            departure: widget.departure,
            arrival: widget.arrival,
            onBook: _bookSeats,
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
