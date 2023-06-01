import 'dart:convert';
import 'package:gps_project/provider/model.dart';
import 'package:http/http.dart' as http;

Future<GetTrackingModel> getLocation() async {
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
    var resp = GetTrackingModel.fromJson(res);

    return resp;
  } else {
    throw Exception(
        'Send APIName : getLocation || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}

Future<GetTrackingModel> getLocationDateTimeBetween(start, end) async {
  String url =
      "https://dint-cms.maholan.net/items/tracking?limit=10000&filter[_and][0][date_created][_between][0]=$start&filter[_and][0][date_created][_between][1]=$end&fields[]=date_created&fields[]=id&fields[]=lat&fields[]=long&sort=-id";
  print(url);
  final response = await http.get(
    Uri.parse('${url}'),
    headers: <String, String>{
      'Authorization': 'Bearer Klxa0fwefguMf4D4jZxxweip7khN-p9M',
    },
  );

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    var resp = GetTrackingModel.fromJson(res);

    return resp;
  } else {
    throw Exception(
        'Send APIName : getLocationDateTimeBetween || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}

Future<GetGoogleMapModel> getGoogleMap(
    String lat1, String long1, String lat2, String long2) async {
  String url =
      "https://maps.googleapis.com/maps/api/distancematrix/json?units=imperial&origins=$lat1,$long1&destinations=$lat2,$long2&key=AIzaSyBmYvXWX1RIOsBL1mgciLLgUHtUFHXGSIw";
  print(url);
  final response = await http.get(
    Uri.parse('${url}'),
  );

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    var resp = GetGoogleMapModel.fromJson(res);

    return resp;
  } else {
    throw Exception(
        'Send APIName : getLocationDateTimeBetween || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}

Future<GetLogGPSModel> getLogGPSBetween(start,end) async {
  print(start);
  print(end);
  String url =
      "https://dint-cms.maholan.net/items/gpslog?limit=1000&fields[]=date_created&fields[]=id&fields[]=km&fields[]=h&fields[]=date&sort[]=-date_created&filter[_and][0][date_created][_between][0]=$start&filter[_and][0][date_created][_between][1]=$end";
  final response = await http.get(
    Uri.parse('${url}'),
    headers: <String, String>{
      'Authorization': 'Bearer Klxa0fwefguMf4D4jZxxweip7khN-p9M',
    },
  );

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    var resp = GetLogGPSModel.fromJson(res);

    return resp;
  } else {
    throw Exception(
        'Send APIName : getLogGPS || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}

Future<GetLogGPSModel> getLogGPS() async {
  String url =
      "https://dint-cms.maholan.net/items/gpslog?limit=1000&fields[]=date_created&fields[]=id&fields[]=km&fields[]=h&fields[]=date&sort[]=-date_created";
  final response = await http.get(
    Uri.parse('${url}'),
    headers: <String, String>{
      'Authorization': 'Bearer Klxa0fwefguMf4D4jZxxweip7khN-p9M',
    },
  );

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    var resp = GetLogGPSModel.fromJson(res);

    return resp;
  } else {
    throw Exception(
        'Send APIName : getLogGPS || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}

Future<void> postLogGPS(km, h) async {
  final response = await http.post(
    Uri.parse('https://dint-cms.maholan.net/items/gpslog'),
    headers: <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer Klxa0fwefguMf4D4jZxxweip7khN-p9M',
    },
    body: jsonEncode(<String, dynamic>{
      'km': km.toString(),
      'h': h.toString(),
    }),
  );

  if (response.statusCode == 200) {
    final res = jsonDecode(response.body);
    // final res = jsonDecode(response.body);
    // var resp = GetTrackingModel.fromJson(res);
    //
    // return resp;
  } else {
    throw Exception(
        'Send APIName : postLogGPS || statusCode : ${response.statusCode.toString()} || Msg : ${jsonDecode(response.body)}');
  }
}
