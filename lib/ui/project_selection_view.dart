import 'package:attendancem_management/ui/attendance_signing_view.dart';
import 'package:attendancem_management/ui/components/app_bar_widget.dart';

import 'package:attendancem_management/ui/styles.dart';
import 'package:attendancem_management/ui/widgets/header_widget.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class ProjectSelectionView extends StatefulWidget {
  const ProjectSelectionView({Key? key}) : super(key: key);

  @override
  State<ProjectSelectionView> createState() => _ProjectSelectionViewState();
}

class _ProjectSelectionViewState extends State<ProjectSelectionView> {
  @override
  Widget build(BuildContext context) {
    const double headerHeight = 250;
    List<String> projectList = [
      'Project Site One',
      'Project Site Two',
      'Project Site Three'
    ];
    List<DropdownMenuItem<String>>? items = projectList
        .map(
          (sites) => DropdownMenuItem(
            value: sites,
            child: Text(
              sites,
              style: Styles.headlineStyle3.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.blueAccent,
              ),
            ),
          ),
        )
        .toList();
    String? selectedValue;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: appBarWidget(context,'Sites'),
      
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: headerHeight,
              child: HeaderWidget(
                headerHeight,
                true,
                Icons.apartment_outlined,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: DropdownButtonFormField(
                value: selectedValue,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                items: items,
                onChanged: (value) {
                  'ON changed called'.log();
                  switch (value) {
                    case 'Project Site One':
                    case 'Project Site Two':
                    case 'Project Site Three':
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const AttendanceSigningView(),
                        ),
                      );
                  }
                },
                hint: Text(
                  "Select Your Project Site ",
                  style: Styles.headlineStyle3.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    //example of attendance report on flutter?
  }
}
