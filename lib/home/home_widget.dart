import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gps_project/common/LoadingPage.dart';
import 'package:gps_project/login/login_widget.dart';
import 'package:gps_project/provider/http.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 5000), () async {
      setCustomMarkerIcon();
      _getLocation();
    });

    super.initState();
  }

  BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;

  void setCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration.empty, "assets/images/moresize.png")
        .then(
      (icon) {
        sourceIcon = icon;
      },
    );
  }

  static LatLng location = const LatLng(18.317669, 99.397742);

  void _getLocation() async {
    await getLocation().then((value) {
      if (value.list != []) {
        setState(() {
          Future.forEach(value.list, (data) async {
            location = LatLng(data.lat, data.long);
          });
        });
      } else {
        setState(() {
          isLoading = true;
        });
      }
    });
    setState(() {
      isLoading = true;
    });
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
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color(0xFF2085E3),
              automaticallyImplyLeading: false,
              title: const Text(
                'Motorcycle GPS Tracker',
                textAlign: TextAlign.center,
              ),
              actions: [],
              centerTitle: true,
              elevation: 2.0,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        width: 385.0,
                        height: 380.0,
                        child: GoogleMap(
                          markers: {
                            Marker(
                              markerId: const MarkerId("source"),
                              position: location,
                              icon: sourceIcon,
                            ),
                          },
                          myLocationEnabled: true,
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: location,
                            zoom: 14.5,
                            // tilt: 59.440717697143555,
                            // bearing: 192.8334901395799,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            _controller.complete(controller);
                          },
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.zero,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(10, 1, 0, 0),
                              child: Container(
                                width: 150.0,
                                height: 200.0,
                                decoration: BoxDecoration(),
                                child: Image.asset(
                                  'assets/images/mo.png',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding:
                                        const EdgeInsets.fromLTRB(0, 10, 0, 10),
                                    child: const Text(
                                      'สถานะการขับขี่',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: 35.0,
                                    height: 40.0,
                                    child: Image.network(
                                      'https://cdn.pixabay.com/photo/2016/02/23/15/52/green-1217966_1280.png',
                                      width: 10.0,
                                      height: 30.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 0, 10),
                                    child: const Text(
                                      'รถวิ่ง',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: 35.0,
                                    height: 35.0,
                                    child: Image.network(
                                      'https://e1.pngegg.com/pngimages/609/567/png-clipart-conception-de-cercle-bouton-web-animation-forme-orange-jaune-ovale.png',
                                      width: 10.0,
                                      height: 30.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 0, 10),
                                    child: const Text(
                                      'รถหยุด',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Container(
                                    padding: EdgeInsets.zero,
                                    width: 35.0,
                                    height: 35.0,
                                    child: Image.network(
                                      'https://cdn.pixabay.com/photo/2012/05/07/02/46/red-47690_1280.png',
                                      width: 10.0,
                                      height: 30.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.fromLTRB(
                                        10, 10, 0, 10),
                                    child: const Text(
                                      'เกิดอุบัติเหตุ',
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: const [
                        Text(
                          'บันทึกการขับขี่',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'ระยะเวลาเดินทาง  / วัน',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'xx',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'ชั่วโมง',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'ระยะการเดินทาง / วัน',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'xx',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'กิโลเมตร',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'เกิดอุบติเหตุ',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'xx',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: const Text(
                            'ครั้ง',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
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
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => AuditWidget(),
                              //   ),
                              // );
                            },
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(1),
                          width: 90.0,
                          height: 90.0,
                          child: IconButton(
                            icon: const Icon(
                              Icons.settings_rounded,
                              size: 70.0,
                            ),
                            onPressed: () async {
                              // await Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (context) => SettingWidget(),
                              //   ),
                              // );
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
                ],
              ),
            ),
          ),
        );
}
