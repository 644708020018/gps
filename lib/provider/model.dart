class GetTrackingModel {
  final List<GetTracking> list;

  GetTrackingModel({
    required this.list,
  });

  factory GetTrackingModel.fromJson(Map<String, dynamic> json) {
    List<GetTracking>? list = [];
    for (dynamic json in json['data']) {
      GetTracking arr = GetTracking(
        date_created: json['date_created'],
        id: json['id'],
        lat: json['lat'],
        long: json['long'],
        // gyro_ax: json['gyro_ax'] ?? 0.0,
        // gyro_ay: json['gyro_ay'] ?? 0.0,
        // gyro_az: json['gyro_az'] ?? 0.0,
      );
      list.add(arr);
    }

    return GetTrackingModel(
      list: list,
    );
  }
}

class GetTracking {
  final String date_created;
  final int id;
  final double lat;
  final double long;
  // final double gyro_ax;
  // final double gyro_ay;
  // final double gyro_az;

  GetTracking({
    required this.date_created,
    required this.id,
    required this.lat,
    required this.long,
    // required this.gyro_ax,
    // required this.gyro_ay,
    // required this.gyro_az,
  });

  factory GetTracking.fromJson(Map<String, dynamic> json) {
    return GetTracking(
      date_created: json['date_created'],
      id: json['id'],
      lat: json['lat'],
      long: json['long'],
      // gyro_ax: json['gyro_ax'],
      // gyro_ay: json['gyro_ay'],
      // gyro_az: json['gyro_az'],
    );
  }
}