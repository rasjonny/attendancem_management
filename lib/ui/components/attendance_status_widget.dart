import 'package:attendancem_management/ui/styles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceStatusWidget extends StatelessWidget {
  final DateTime date;
  final String status;
  const AttendanceStatusWidget({super.key, required this.date, required this.status});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat.yMMMMEEEEd().format(date);
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 10, left: 28, right: 28, bottom: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              format,
              style: Styles.headlineStyle3.copyWith(color: Colors.blueAccent),
            ),
            Text(
              status,
              style: Styles.headlineStyle2.copyWith(color: Colors.blueAccent),
            )
          ],
        ),
      ),
    );
  }
}
