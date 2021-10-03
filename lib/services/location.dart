import 'package:geolocator/geolocator.dart';
import 'package:weather/services/networking.dart';

String openweathermap = "https://api.openweathermap.org/data/2.5/weather?";
String apikey = "577ac7217d02d1e7e6690985ca5d918e";

class Location {
  Future<dynamic> getCurrLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.low);
      dynamic weatherdata = await FetchData(
              "$openweathermap&lat=${position.latitude}&lon=${position.longitude}&appid=$apikey&units=metric")
          .getData();
      return weatherdata;
    } catch (e) {
      throw Exception(e);
    }
  }
}
