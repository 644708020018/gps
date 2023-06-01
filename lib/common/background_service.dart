import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_background_service/flutter_background_service.dart';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter_background_service_android/flutter_background_service_android.dart';
import 'package:gps_project/provider/http.dart';
import 'package:gps_project/provider/model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';
import 'dart:io';

Future<void> initializeService() async {
  final service = FlutterBackgroundService();

  // if (Platform.isIOS) {
  //   await flutterLocalNotificationsPlugin.initialize(
  //     const InitializationSettings(
  //       iOS: IOSInitializationSettings(),
  //     ),
  //   );
  // }
  // UserInfo data = await GetUserProfile();
  //
  // if (data.roleId == "3")  {
  //   await getCurrentLocation().then((value) async {
  //     latitude = value.latitude;
  //     longitude = value.longitude;
  //     liveLocation();
  //   });
  // }

  await service.configure(
    androidConfiguration: AndroidConfiguration(
      onStart: onStart,
      autoStart: true,
      isForegroundMode: true,
    ),
    iosConfiguration: IosConfiguration(
      autoStart: true,
      onForeground: onStart,
      onBackground: onIosBackground,
    ),
  );

  service.startService();
}

@pragma('vm:entry-point')
void onStart(ServiceInstance service) async {
  DartPluginRegistrant.ensureInitialized();

  if (service is AndroidServiceInstance) {
    service.on('setAsForeground').listen((event) {
      service.setAsForegroundService();
    });

    service.on('setAsBackground').listen((event) {
      service.setAsBackgroundService();
    });
  }

  service.on('stopService').listen((event) {
    service.stopSelf();
  });


  //todo bring to foreground
  Timer.periodic(const Duration(seconds: 2), (timer) async {

    DateTime today = DateTime.now();
    DateTime checkpoint = DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, 23, 59, 55);

    // print('today      : ${today.toString()}');
    // print('checkpoint : ${checkpoint.toString()}');
    // print('');
    if ((today.day == checkpoint.day) && (today.hour >= checkpoint.hour) && (today.minute >= checkpoint.minute && today.second > checkpoint.second - 3 && today.second < checkpoint.second)) {
      DateTime start = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 00, 00);
      DateTime end = DateTime(DateTime.now().year, DateTime.now().month,
          DateTime.now().day, 23, 59, 59);

      GetTrackingModel res = await getLocationDateTimeBetween(start, end);
      int sumMi = 0;
      int sumH = 0;
      double km = 0;
      double h = 0;
      for (int i = 0; i <= res.list.length / 2; i++) {
        if (res.list[i].lat.toString() != res.list[i + 1].lat.toString() &&
            res.list[i].long.toString() != res.list[i + 1].long.toString()) {
          print(res.list[i].id);
          print(res.list[i + 1].id);
          print('');
          GetGoogleMapModel google = await getGoogleMap(
              res.list[i].lat.toString(),
              res.list[i].long.toString(),
              res.list[i + 1].lat.toString(),
              res.list[i + 1].long.toString());

          sumMi += google.valueMi;
          sumH += google.valueTime;

          print(sumMi);
          print(sumH);
          print('');
        }
      }

      km = sumMi / 1.609344;
      h = sumH / 60;

      await postLogGPS(km, h);
    }

    // test using external plugin
    final deviceInfo = DeviceInfoPlugin();
    String? device;
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      device = androidInfo.model;
    }

    if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      device = iosInfo.model;
    }

    service.invoke(
      'update',
      {
        "current_date": DateTime.now().toIso8601String(),
        "device": device,
      },
    );
  });
}

@pragma('vm:entry-point')
Future<bool> onIosBackground(ServiceInstance service) async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  SharedPreferences preferences = await SharedPreferences.getInstance();
  await preferences.reload();
  final log = preferences.getStringList('log') ?? <String>[];
  log.add(DateTime.now().toIso8601String());
  await preferences.setStringList('log', log);

  return true;
}
