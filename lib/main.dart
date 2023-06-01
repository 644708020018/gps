import 'package:gps_project/common/background_service.dart';
import 'package:gps_project/home/home_widget.dart';
import 'package:gps_project/loggps/log_gps_widget.dart';
import 'package:gps_project/login/login_widget.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeService();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: const LoginWidget(),
      home: LogGPSWidget(),
    );
  }
}
