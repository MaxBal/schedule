import 'package:schedule/helpers/scheduler-date.dart';
import 'package:schedule/models/lesson.dart';

class Day {
  String name;
  String date;
  int weekCode;
  List<Lesson> lessons;

  Day({this.name, this.date, this.weekCode, this.lessons});

  factory Day.fromJson(Map<String, dynamic> parsedJson) {
    var list = parsedJson['lessons'] as List;
    List<Lesson> lessons = list.map((i) => Lesson.fromJson(i)).toList();
    String formattedDate =
        parsedJson['date'] != null ? parseDate(parsedJson['date']) : null;

    return Day(
        name: parsedJson['name'],
        date: formattedDate,
        weekCode: parsedJson['weekCode'],
        lessons: lessons);
  }
}
