import 'package:attendancem_management/auth/provider/attendance_history_provider.dart';
import 'package:attendancem_management/ui/components/app_bar_widget.dart';
import 'package:attendancem_management/ui/components/attendance_status_widget.dart';
import 'package:attendancem_management/ui/styles.dart';

import 'package:attendancem_management/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class AttendanceHistoryView extends ConsumerWidget {
  const AttendanceHistoryView({super.key});
  @override
  Widget build(BuildContext context, ref) {
    const double headerHeight = 250;
    final attendanceHistory = ref.watch(attendanceHistoryProvider);
    return Scaffold(
      appBar: appBarWidget(context, 'Attendance History'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: headerHeight,
              child: HeaderWidget(
                headerHeight,
                true,
                Icons.note,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24.0,
                bottom: 5,
                left: 24,
                right: 24,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Date',
                    style:
                        Styles.headlineStyle2.copyWith(color: Colors.blueGrey),
                  ),
                  Text(
                    'Status',
                    style:
                        Styles.headlineStyle2.copyWith(color: Colors.blueGrey),
                  )
                ],
              ),
            ),
            attendanceHistory.when(
              data: ((attendanceHistoryModel) {
                return ListView.builder(
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return AttendanceStatusWidget(
                      date: attendanceHistoryModel.date,
                      status: attendanceHistoryModel.status,
                    );
                  },
                );
              }),
              error: ((e, s) => const Text('Something went wrong!')),
              loading: () => const CircularProgressIndicator(),
            ),
            AttendanceStatusWidget(date: DateTime.now(), status: "✔")
          ],
        ),
      ),
    );
  }
}
