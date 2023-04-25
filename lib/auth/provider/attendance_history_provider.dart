import 'dart:convert';

import 'package:attendancem_management/model/attendance_history_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:http/http.dart' as http;
final attendanceHistoryProvider = FutureProvider.autoDispose<AttendanceHistoryModel>(
  (ref)async {
const url ='http://localhost:5000/private';

  final response = await http.get(
    Uri.parse(url),
    
  );

  if (response.statusCode == 200) {
   
    return AttendanceHistoryModel.fromJson(json.decode(response.body));
  } else {
   
    throw Exception('Failed to load album');
  }
  },
);



