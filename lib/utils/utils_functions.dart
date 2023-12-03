import 'package:geocoding/geocoding.dart';
import 'package:gereaulas_mobile/utils/app_routes.dart';

int differenceBetweenDate(DateTime d1, DateTime d2) {
  return DateTime(d2.year, d2.month, d2.day)
      .difference(DateTime(d1.year, d1.month, d1.day))
      .inDays;
}

class LocationUtil {
  static String generateLocationPreviewImage({
    double? latitude,
    double? longitude,
  }) {
    //https://developers.google.com/maps/documentation/maps-static/overview
    //https://pub.dev/packages/google_maps_flutter
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$latitude,$longitude&zoom=13&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static String generateAddress({double? latitude, double? longitude}) {
    return 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$latitude,$longitude&key=$GOOGLE_API_KEY';
  }

  static Future<String> getAddressString(
      {required double latitude, required double longitude}) async {
    List<Placemark> placemarks =
        await placemarkFromCoordinates(52.2165157, 6.9437819);
    print(placemarks.first.toString());

    return "Address";
  }
}
