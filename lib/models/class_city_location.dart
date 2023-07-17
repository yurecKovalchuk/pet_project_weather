class City {
  City({
    required this.name,
    required this.location,
  });

  String? name;
  Location? location;

  @override
  String toString() {
    return 'City{name: $name, location: $location}';
  }
}

class Location {
  Location({
    required this.lat,
    required this.lon,
  });

  double? lat;
  double? lon;

  @override
  String toString() {
    return 'Location{lat: $lat, lon: $lon}';
  }
}
