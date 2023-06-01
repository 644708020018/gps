import 'package:flutter/material.dart';
import 'package:gps_project/home/home_widget.dart';
import 'package:gps_project/loggps/log_gps_widget.dart';
import 'package:gps_project/login/login_widget.dart';

class Bottom_Navigation_Bar extends StatefulWidget {
  const Bottom_Navigation_Bar({Key? key}) : super(key: key);

  @override
  State<Bottom_Navigation_Bar> createState() => _Bottom_Navigation_BarState();
}

class _Bottom_Navigation_BarState extends State<Bottom_Navigation_Bar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(1),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(1),
              width: 90.0,
              height: 90.0,
              child: IconButton(
                icon: const Icon(
                  Icons.home_rounded,
                  size: 70.0,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomeWidget(),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              width: 90.0,
              height: 90.0,
              child: IconButton(
                icon: const Icon(
                  Icons.home_work_outlined,
                  size: 70.0,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const LogGPSWidget(),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(1),
              width: 90.0,
              height: 90.0,
              child: IconButton(
                icon: const Icon(
                  Icons.logout,
                  size: 70.0,
                ),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginWidget(),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
