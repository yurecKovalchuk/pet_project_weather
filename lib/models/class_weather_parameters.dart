class WeatherParameters {
  WeatherParameters(
    this.user,
    this.dateGenerated,
    this.status,
    this.data,
  );

  final String user;
  DateTime dateGenerated;
  String status;
  List<WeatherData> data;

  factory WeatherParameters.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<WeatherData> data =
        dataList.map((item) => WeatherData.fromJson(item)).toList();

    return WeatherParameters(
      json['user'],
      DateTime.parse(json['dateGenerated']),
      json['status'],
      data,
    );
  }
}

class WeatherData {
  WeatherData(
    this.parameter,
    this.coordinates,
  );

  String parameter;
  List<Coordinates> coordinates;

  factory WeatherData.fromJson(Map<String, dynamic> json) {
    var coordinatesList = json['coordinates'] as List;
    List<Coordinates> coordinates =
        coordinatesList.map((item) => Coordinates.fromJson(item)).toList();

    return WeatherData(
      json['parameter'],
      coordinates,
    );
  }
}

class Coordinates {
  Coordinates(
    this.lat,
    this.lon,
    this.dates,
  );

  double lat;
  double lon;
  List<DateWeather> dates;

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    var datesList = json['dates'] as List;
    List<DateWeather> dates =
        datesList.map((item) => DateWeather.fromJson(item)).toList();

    return Coordinates(
      json['lat'],
      json['lon'],
      dates,
    );
  }
}

class DateWeather {
  DateWeather(
    this.date,
    this.value,
  );

  DateTime date;
  double value;

  factory DateWeather.fromJson(Map<String, dynamic> json) {
    return DateWeather(
      DateTime.parse(json['date']),
      json['value'],
    );
  }
}
