import 'package:shared_preferences/shared_preferences.dart';

class BookSeats {
  static const String _bookedSeatsKeyPrefix = 'bookedSeats_';

// 출발역과 도착역을 입력받아 SharedPreferences에 저장될 고유한 키를 생성
  static String _generateKey(String departure, String arrival) {
    return '$_bookedSeatsKeyPrefix$departure-$arrival';
  }

// 지정된 출발역과 도착역에 대해 SharedPreferences에서 예약된 좌석 목록을 가져옴
  static Future<List<String>> getBookedSeats(
      String departure, String arrival) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    return prefs.getStringList(key) ?? [];
  }

// 지정된 출발역과 도착역에 대해 SharedPreferences에 좌석 목록을 저장
  static Future<void> bookSeats(
      String departure, String arrival, List<String> seats) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    List<String> bookedSeats = prefs.getStringList(key) ?? [];
    bookedSeats.addAll(seats);
    bookedSeats = bookedSeats.toSet().toList();
    await prefs.setStringList(key, bookedSeats);
  }

// 지정된 출발역과 도착역에 대한 SharedPreferences에 저장된 예약 정보를 삭제
  static Future<void> clearBookedSeats(String departure, String arrival) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    await prefs.remove(key);
  }
}
