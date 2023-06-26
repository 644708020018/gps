class GetTrackingModel {
  final List<GetTracking> list;

  GetTrackingModel({
    required this.list,
  });

  factory GetTrackingModel.fromJson(Map<String, dynamic> json) {
    List<GetTracking>? list = [];
    for (dynamic json in json['data']) {
      double lat = 0.0;
      double long = 0.0;
      if (json['lat'].toString().length > 1 && json['lat'] != null) {
        lat = json['lat'] ?? 0.0;
      } else {
        lat += json['lat'] ?? 0.0;
      }

      if (json['lat'].toString().length > 1 && json['long'] != null) {
        long = json['long'] ?? 0.0;
      } else {
        long += json['long'] ?? 0.0;
      }

      GetTracking arr = GetTracking(
        date_created: json['date_created'],
        id: json['id'],
        lat: lat,
        long: long,
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
  late final double lat;
  late final double long;

  GetTracking({
    required this.date_created,
    required this.id,
    required this.lat,
    required this.long,
  });

  factory GetTracking.fromJson(Map<String, dynamic> json) {
    double lat = 0.0;
    double long = 0.0;
    if (json['lat'].toString().length > 1) {
      lat = json['lat'];
    } else {
      lat += json['lat'];
    }

    if (json['lat'].toString().length > 1) {
      long = json['long'];
    } else {
      long += json['long'];
    }

    return GetTracking(
      date_created: json['date_created'],
      id: json['id'],
      lat: lat,
      long: long,
    );
  }
}

class GetGoogleMapModel {
  final String km;
  final int valueMi;
  final String time;
  final int valueTime;

  GetGoogleMapModel({
    required this.km,
    required this.valueMi,
    required this.time,
    required this.valueTime,
  });

  factory GetGoogleMapModel.fromJson(Map<String, dynamic> json) {
    dynamic data1 = json['rows'][0]['elements'][0]['distance'];
    dynamic data2 = json['rows'][0]['elements'][0]['duration'];
    String km = data1['text'];
    int valueMi = data1['value'];
    String time = data2['text'];
    int valueTime = data2['value'];
    return GetGoogleMapModel(
      km: km,
      valueMi: valueMi,
      time: time,
      valueTime: valueTime,
    );
  }
}

class GetLogGPSModel {
  final List<GetLogGPS> list;

  GetLogGPSModel({required this.list});

  factory GetLogGPSModel.fromJson(Map<String, dynamic> json) {
    List<GetLogGPS>? list = [];
    for (dynamic json in json['data']) {
      GetLogGPS arr = GetLogGPS(
        date_created: json['date_created'],
        id: json['id'],
        km: json['km'],
        h: json['h'],
        m: '',
      );
      list.add(arr);
    }

    return GetLogGPSModel(
      list: list,
    );
  }
}

class GetLogGPS {
  final String date_created;
  final int id;
  final String km;
  final String h;
  final String m;

  GetLogGPS({
    required this.date_created,
    required this.id,
    required this.km,
    required this.h,
    required this.m,
  });

  factory GetLogGPS.fromJson(Map<String, dynamic> json) {
    return GetLogGPS(
      date_created: json['date_created'],
      id: json['id'],
      km: json['km'],
      h: json['h'],
      m: '',
    );
  }
}
