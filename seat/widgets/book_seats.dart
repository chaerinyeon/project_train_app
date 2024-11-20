import 'package:shared_preferences/shared_preferences.dart';

class BookSeats {
  static const String _bookedSeatsKeyPrefix = 'bookedSeats_';

  static String _generateKey(String departure, String arrival) {
    return '$_bookedSeatsKeyPrefix$departure-$arrival';
  }

  static Future<List<String>> getBookedSeats(
      String departure, String arrival) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    return prefs.getStringList(key) ?? [];
  }

  static Future<void> bookSeats(
      String departure, String arrival, List<String> seats) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    List<String> bookedSeats = prefs.getStringList(key) ?? [];
    bookedSeats.addAll(seats);
    bookedSeats = bookedSeats.toSet().toList();
    await prefs.setStringList(key, bookedSeats);
  }

  static Future<void> clearBookedSeats(String departure, String arrival) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String key = _generateKey(departure, arrival);
    await prefs.remove(key);
  }
}
