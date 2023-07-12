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
  double? lat;
  double? lon;

  Location({
    required this.lat,
    required this.lon,
  });

  @override
  String toString() {
    return 'Location{lat: $lat, lon: $lon}';
  }
}
