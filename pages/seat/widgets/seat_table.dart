import 'package:flutter/material.dart';

class SeatTable extends StatelessWidget {
  final int rows; 
  final String? selectedSeat; 
  final Function(String)? onSeatSelected; 

  const SeatTable({
    this.rows = 20, 
    this.selectedSeat,
    this.onSeatSelected,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rows, 
      itemBuilder: (context, rowIndex) {
        return Column(
          children: [
           
            if (rowIndex == 0)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  for (var i = 0; i < 2; i++)
                    _buildLabel(String.fromCharCode(65 + i)), 
                  SizedBox(width: 40), 
                  for (var i = 2; i < 4; i++)
                    _buildLabel(String.fromCharCode(65 + i)), 
                ],
              ),
            SizedBox(height: 4), 
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 4.0), 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                
                  for (var i = 0; i < 2; i++)
                    _buildSeat(rowIndex + 1,
                        String.fromCharCode(65 + i)), 

                  Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(
                      '${rowIndex + 1}',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),

                  
                  for (var i = 2; i < 4; i++)
                    _buildSeat(rowIndex + 1,
                        String.fromCharCode(65 + i)), 
                ],
              ),
            ),
          ],
        );
      },
    );
  }

 
  Widget _buildLabel(String label) {
    return Container(
      width: 50,
      height: 50,
      alignment: Alignment.center,
      child: Text(
        label,
        style: TextStyle(fontSize: 18),
      ),
    );
  }

  
  Widget _buildSeat(int row, String column) {
    final seatId = '$row-$column'; 
    final isSelected = selectedSeat == seatId;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2), 
      child: GestureDetector(
        onTap: () {
          if (onSeatSelected != null) {
            onSeatSelected!(seatId);
          }
        },
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            color: isSelected ? Colors.purple : (Colors.grey[300]!),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
      ),
    );
  }
}
