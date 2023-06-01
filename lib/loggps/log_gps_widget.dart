import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gps_project/common/LoadingPage.dart';
import 'package:gps_project/common/bottom_navigation_bar.dart';
import 'package:gps_project/home/home_widget.dart';
import 'package:gps_project/login/login_widget.dart';
import 'package:gps_project/common/background_service.dart';
import 'package:gps_project/provider/http.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gps_project/provider/model.dart';
import 'package:intl/intl.dart';

class LogGPSWidget extends StatefulWidget {
  const LogGPSWidget({Key? key}) : super(key: key);

  @override
  _LogGPSWidgetState createState() => _LogGPSWidgetState();
}

class _LogGPSWidgetState extends State<LogGPSWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _getLogGPS();
    super.initState();
  }

  List<GetLogGPS> res = [];
  var newFormat = DateFormat("dd-MM-yyyy");

  _getLogGPS() async {
    res = [];
    await getLogGPS().then((value) => {
          Future.forEach(value.list, (m1) async {
            print(m1.date_created);

            DateTime time =
                DateTime.parse(m1.date_created).add(const Duration(hours: -17));
            // DateTime time = DateTime.parse(m1.date_created);
            final String date_created = newFormat.format(time);

            double kmF = double.parse(m1.km);
            double data_time = double.parse(m1.h);

            kmF /= 1000;

            double h = 0.0;
            double m = 0.0;

            var f = NumberFormat("###.##", "en_US");
            var fm = NumberFormat("###", "en_US");

            var km = f.format(kmF);

            h = data_time / 60;
            m = data_time % 60;

            var minute = fm.format(m);

            String strHour = h.toString();
            List<String> arrHour = strHour.split('.');
            String hour = arrHour[0];

            GetLogGPS data = GetLogGPS(
              date_created: date_created,
              id: m1.id,
              km: km.toString(),
              h: hour,
              m: minute.toString(),
            );

            setState(() {
              res.add(data);
            });
          })
        });
    setState(() {
      isLoading = true;
    });
  }

  _getBetweenLogGps(start, end) async {
    res = [];
    await getLogGPSBetween(start.toString(), end.toString()).then((value) {
      Future.forEach(value.list, (m1) async {
        print(m1.id);
        DateTime time =
            DateTime.parse(m1.date_created).add(const Duration(hours: -17));
        // DateTime time = DateTime.parse(m1.date_created);
        final String dateCreated = newFormat.format(time);
        double kmF = double.parse(m1.km);
        double dataTime = double.parse(m1.h);

        kmF /= 1000;

        double h = 0.0;
        double m = 0.0;

        var f = NumberFormat("###.##", "en_US");
        var fm = NumberFormat("###", "en_US");

        var km = f.format(kmF);

        h = dataTime / 60;
        m = dataTime % 60;

        var minute = fm.format(m);

        String strHour = h.toString();
        List<String> arrHour = strHour.split('.');
        String hour = arrHour[0];

        GetLogGPS data = GetLogGPS(
          date_created: dateCreated,
          id: m1.id,
          km: km.toString(),
          h: hour,
          m: minute.toString(),
        );

        setState(() {
          res.add(data);
        });
      });
    });
  }

  String startDate = '';
  String endDate = '';

  DateTime queryStartDate = DateTime.now();
  DateTime queryEndDate = DateTime.now();

  void pickDate(DateTime date, bool flex) {
    final String formatted = newFormat.format(date);

    if (flex) {
      setState(() {
        queryStartDate = date.add(const Duration(days: 1));
        startDate = formatted.toString();
      });
    } else {
      setState(() {
        queryEndDate = date.add(const Duration(days: 1, hours: 23));
        endDate = formatted.toString();
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) => isLoading == false
      ? const LoadingPage()
      : GestureDetector(
          child: Scaffold(
            key: scaffoldKey,
            bottomNavigationBar: const Bottom_Navigation_Bar(),
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color(0xFF2085E3),
              automaticallyImplyLeading: false,
              title: const Text(
                'Travel History',
                textAlign: TextAlign.center,
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Container(
                      padding: EdgeInsets.zero,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                startDate == ''
                                    ? const Text('Start Date')
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text('Start Date'),
                                          Text(startDate.toString()),
                                        ],
                                      ),
                                IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1960),
                                      lastDate: DateTime(2999),
                                    ).then((date) => pickDate(date!, true));
                                  },
                                  icon: const Icon(Icons.date_range),
                                ),
                                endDate == ''
                                    ? const Text('End Date')
                                    : Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          const Text('End Date'),
                                          Text(endDate.toString()),
                                        ],
                                      ),
                                IconButton(
                                  onPressed: () {
                                    showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1960),
                                      lastDate: DateTime(2999),
                                    ).then((date) => pickDate(date!, false));
                                  },
                                  icon: const Icon(Icons.date_range),
                                ),
                                Container(
                                  padding:
                                  const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: IconButton(
                                    onPressed: () async {
                                      await _getBetweenLogGps(
                                          queryStartDate.toString(),
                                          queryEndDate.toString());
                                    },
                                    icon: const Icon(Icons.search),
                                  ),
                                ),
                                startDate != "" || endDate != "" ? Container(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: IconButton(
                                    onPressed: () async {
                                      setState(() {
                                        startDate = "";
                                        endDate = "";
                                      });
                                      await _getLogGPS();
                                    },
                                    icon: const Icon(Icons.clear),
                                  ),
                                ) : Container()
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  for (var data in res) ...[
                    Container(
                      // padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 18.0),
                      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.width * 100,
                      child: Card(
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        elevation: 8,
                        child: SingleChildScrollView(
                            padding: EdgeInsets.all(5),
                            child: Column(
                              children: [
                                Text(
                                  'วันที่ : ${data.date_created}',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'ระยะทางในการเดินทาง : ${data.km} กิโลเมตร',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  'เวลาในการเดินทาง : ${data.h} ชั่วโมง ${data.m} นาที',
                                  style: const TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        );
}
