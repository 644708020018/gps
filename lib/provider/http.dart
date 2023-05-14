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