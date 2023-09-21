import 'package:weather/feature/data/data_sources/data_sources.dart';
import 'package:weather/models/models.dart';

class StaticDataSource {
  final List<City> cities = [
    City(name: "Kiev", location: Location(lat: 50.4501, lon: 30.5234)),
    City(name: "Lviv", location: Location(lat: 49.8397, lon: 24.0297)),
    City(name: "Odesa", location: Location(lat: 46.4825, lon: 30.7233)),
  ];

  final CityNotifier _cityNotifier = CityNotifier();

  get cityNotifier => _cityNotifier;
}
