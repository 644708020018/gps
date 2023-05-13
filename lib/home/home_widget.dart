import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gps_project/register/register_widget.dart';

import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class Local {
  late double lat = 0;
  late double lng = 0;

  Local({required this.lat, required this.lng});

  Map toJson() {
    return {'lat': lat, 'long': lng};
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<GoogleMapController> _controller = Completer();

  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 5000), () async {
      Local res =  await getLocation();
      setState(() {
        lat = res.lat;
        lng = res.lng;
      });
    });


    // setCustomMarkerIcon();
    super.initState();
  }

  // BitmapDescriptor sourceIcon = BitmapDescriptor.defaultMarker;
  //
  // void setCustomMarkerIcon() {
  //   BitmapDescriptor.fromAssetImage(ImageConfiguration.empty, "assets/mo.png")
  //       .then(
  //     (icon) {
  //       sourceIcon = icon;
  //     },
  //   );
  // }

  late double lat = 0;
  late double lng = 0;

  Future<Local> getLocation() async {
    String url =
        "https://dint-cms.maholan.net/items/tracking?limit=1&fields[]=date_created&fields[]=id&fields[]=lat&fields[]=long&fields[]=gyro_ax&fields[]=gyro_ay&fields[]=gyro_az&sort=-id";
    final response = await http.get(
      Uri.parse('${url}'),
      headers: <String, String>{
        'Authorization': 'Bearer Klxa0fwefguMf4D4jZxxweip7khN-p9M',
      },
    );

    if (response.statusCode == 200) {
      final res = jsonDecode(response.body);

      Local local = Local(
        lat: res['data'][0]['lat'],
        lng: res['data'][0]['long'],
      );

      return local;
    } else {
      throw Exception(
          'Send APIName : getLocation || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    width: 385.0,
                    height: 380.0,
                    child: GoogleMap(
                      markers: {
                        Marker(
                          markerId: const MarkerId("source"),
                          position: LatLng(lat, lng),
                          // icon: sourceIcon,
                        ),
                      },
                      myLocationEnabled: true,
                      mapType: MapType.normal,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(lat, lng),
                        zoom: 16,
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
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              10.0, 0.0, 0.0, 0.0),
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
                      padding:
                          EdgeInsetsDirectional.fromSTEB(30.0, 35.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                decoration: BoxDecoration(),
                                child: Image.network(
                                  'https://cdn.pixabay.com/photo/2016/02/23/15/52/green-1217966_1280.png',
                                  width: 10.0,
                                  height: 30.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 15.0, 0.0, 15.0),
                                child: Container(
                                  width: 35.0,
                                  height: 35.0,
                                  decoration: BoxDecoration(),
                                  child: Image.network(
                                    'https://e1.pngegg.com/pngimages/609/567/png-clipart-conception-de-cercle-bouton-web-animation-forme-orange-jaune-ovale.png',
                                    width: 100.0,
                                    height: 100.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: 35.0,
                                height: 35.0,
                                decoration: BoxDecoration(),
                                child: Image.network(
                                  'https://cdn.pixabay.com/photo/2012/05/07/02/46/red-47690_1280.png',
                                  width: 100.0,
                                  height: 100.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  'สถานะการขับขี่',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Poppins',
                                  //       fontSize: 20.0,
                                  //       fontWeight: FontWeight.w800,
                                  //     ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 15.0),
                                child: Text(
                                  'รถวิ่ง',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Poppins',
                                  //       fontSize: 20.0,
                                  //       fontWeight: FontWeight.normal,
                                  //     ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 18.0),
                                child: Text(
                                  'รถหยุด',
                                  // style: FlutterFlowTheme.of(context)
                                  //     .bodyMedium
                                  //     .override(
                                  //       fontFamily: 'Poppins',
                                  //       fontSize: 20.0,
                                  //       fontWeight: FontWeight.normal,
                                  //     ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                'เกิดอุบัติเหตุ',
                                // style: FlutterFlowTheme.of(context)
                                //     .bodyMedium
                                //     .override(
                                //       fontFamily: 'Poppins',
                                //       fontSize: 20.0,
                                //       fontWeight: FontWeight.normal,
                                //     ),
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
                padding: EdgeInsetsDirectional.fromSTEB(10.0, 5.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'บันทึกการขับขี่',
                      // style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //       fontFamily: 'Poppins',
                      //       fontSize: 25.0,
                      //     ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(30.0, 0.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Text(
                        'ระยะเวลาเดินทาง  / วัน         xx     ชั่วโมง',
                        // style: FlutterFlowTheme.of(context).bodyMedium.override(
                        //       fontFamily: 'Poppins',
                        //       fontSize: 18.0,
                        //     ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 0.0, 0.0),
                    child: Text(
                      'ระยะการเดินทาง  / วัน           xx    กิโลเมตร',
                      // style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //       fontFamily: 'Poppins',
                      //       fontSize: 18.0,
                      //     ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(30.0, 5.0, 0.0, 0.0),
                    child: Text(
                      'เกิดอุบติเหตุ                            xx     ครั้ง',
                      // style: FlutterFlowTheme.of(context).bodyMedium.override(
                      //       fontFamily: 'Poppins',
                      //       fontSize: 18.0,
                      //     ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(2.0, 8.0, 2.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          child: IconButton(
                            icon: Icon(
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
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          child: IconButton(
                            icon: Icon(
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
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(),
                          child: IconButton(
                            icon: Icon(
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
                      ],
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 90.0,
                          height: 90.0,
                          decoration: BoxDecoration(),
                          child: Align(
                            alignment: AlignmentDirectional(-1.0, 0.0),
                            child: IconButton(
                              icon: Icon(
                                Icons.logout,
                                size: 70.0,
                              ),
                              onPressed: () async {
                                await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => RegisterPage(),
                                  ),
                                );
                              },
                            ),
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
      ),
    );
  }
}
