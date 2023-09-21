import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import 'package:weather/models/models.dart';

class GetRequest {
  GetRequest();

  DateFormat dateFormat = DateFormat('yyyy-MM-ddTHH:mm:ss');

  Future fetchWeatherData(City city) async {
    DateTime currentTime = DateTime.now();
    final formattedCurrentTime = dateFormat.format(currentTime);
    final formattedFutureTime =
        dateFormat.format(currentTime.add(const Duration(days: 2)));

    String username = 'odesaexp_kovalchuk_yurii';
    String password = '6eED4l9W8y';

    String basicAuth = 'Basic ${base64Encode(
          utf8.encode('$username:$password'),
        )}';

    String url =
        'https://api.meteomatics.com/$formattedCurrentTime+00:00--$formattedFutureTime+00:00:PT2H/t_2m:C,precip_1h:mm,wind_speed_10m:ms/${city.location?.lat.toString() ?? "46.4825"},${city.location?.lon.toString() ?? "30.7233"}/json';

    var response = await http.get(
      Uri.parse(url),
      headers: {'authorization': basicAuth},
    );

    if (response.statusCode == 200) {
      var json = jsonDecode(response.body);

      return WeatherParameters.fromJson(json);
    } else {
      return ('Request failed with status: ${response.statusCode}.');
    }
  }
}
