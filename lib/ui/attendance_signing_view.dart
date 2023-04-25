import 'dart:async';
import 'package:attendancem_management/model/user_response_model.dart';
import 'package:http/http.dart' as http;
import 'package:attendancem_management/services/location/location.dart';
import 'package:attendancem_management/ui/attendance_history_view.dart';
import 'package:attendancem_management/ui/components/app_bar_widget.dart';
import 'package:attendancem_management/ui/helper/theme_helper.dart';

import 'package:attendancem_management/ui/styles.dart';
import 'package:attendancem_management/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceSigningView extends StatefulWidget {
  const AttendanceSigningView({super.key});

  @override
  State<AttendanceSigningView> createState() => _AttendanceSigningViewState();
}

class _AttendanceSigningViewState extends State<AttendanceSigningView> {
  @override
  Widget build(BuildContext context) {
    const double headerHeight = 250;
    final locationService = LocationServiceImpl();
    final text = StreamController<String>();
    text.add("SignIn");
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context, 'Attendance'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: headerHeight,
              child: HeaderWidget(
                headerHeight,
                true,
                Icons.note_alt_rounded,
              ),
            ),
            Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "SignIn Today's Attendance",
                            style: Styles.headlineStyle4.copyWith(
                              fontWeight: FontWeight.w800,
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        Container(
                          decoration:
                              ThemeHelper().buttonBoxDecoration(context),
                          child: ElevatedButton(
                            style: ThemeHelper().buttonStyle(),
                            onPressed: () async {
                              final sign = await locationService.isOnSite();
                              switch (sign) {
                                case false:
                                  text.add(
                                    "✖ Try Again!",
                                  );

                                  break;
                                case true:
                                  sendData(sign);
                                  text.add(
                                    '✔ You have properyly signed todays attendance.',
                                  );
                                  break;
                              }
                            },
                            child: StreamBuilder(
                              stream: text.stream,
                              builder: ((context, snapshot) {
                                switch (snapshot.connectionState) {
                                  case ConnectionState.none:
                                    return Text(
                                      'SignIn',
                                      style: Styles.headlineStyle4.copyWith(
                                          fontSize: 5,
                                          fontWeight: FontWeight.w100),
                                    );
                                  case ConnectionState.waiting:
                                    return const CircularProgressIndicator();
                                  case ConnectionState.active:
                                  case ConnectionState.done:
                                    return Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                        40,
                                        10,
                                        40,
                                        10,
                                      ),
                                      child: Text(
                                        snapshot.data!,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                }
                              }),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                      ],
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 75),
                      decoration: ThemeHelper().buttonBoxDecoration(context),
                      child: ElevatedButton(
                        style: ThemeHelper().buttonStyle(),
                        onPressed: () {
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const AttendanceHistoryView(),
                            ),
                          );
                        },
                        child: const Padding(
                          padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                          child: Text(
                            'Attendance History',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

sendData(bool success) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getString("id")!;
  var url = "http://localhost:5000/login";
  await http.post(
    Uri.parse(url),
    body: UserResponseModel(
      date: DateTime.now(),
      status: success ? "✔" : "✖",
      id: id,
    ),
  );
}
