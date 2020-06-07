import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> getScheduleJson() async {
  dynamic response = await http.get(
    'https://api.github.com/gists/889bf2dcdd2499bd931f138cb6a7018f',
    headers: {HttpHeaders.userAgentHeader: "MaxBal"},
  );
  Map<dynamic, dynamic> schedule = jsonDecode(response.body);
  print('schedule = ' + schedule.toString());
  return schedule['files']['schedule.json'];
}

/// For local json load
Future<String> getLocalScheduleJson() async {
  return await rootBundle.loadString('assets/schedule.json');
}
