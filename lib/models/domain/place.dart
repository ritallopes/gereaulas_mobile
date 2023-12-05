import 'dart:io';

class Place {
  final double latitude;
  final double longitude;
  final String address;

  const Place({
    required this.latitude,
    required this.longitude,
    this.address = '',
  });
  @override
  String toString() {
    return 'Place{latitude: $latitude, longitude: $longitude, address: $address}';
  }
}
