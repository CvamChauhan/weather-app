import 'package:http/http.dart' as http;
import 'dart:convert';

class FetchData {
  String? url;
  FetchData(this.url);
  Future<dynamic> getData() async {
    http.Response response = await http.get(Uri.parse(url!));
    if (response.statusCode == 200) {
      String data = response.body;
      return jsonDecode(data);
    } else {
      print("status code = ${response.statusCode}");
    }
  }
}

String getWeatherIcon(int condition) {
  if (condition < 300) {
    return '🌩';
  } else if (condition < 400) {
    return '🌧';
  } else if (condition < 600) {
    return '☔️';
  } else if (condition < 700) {
    return '☃️';
  } else if (condition < 800) {
    return '🌫';
  } else if (condition == 800) {
    return '☀️';
  } else if (condition <= 804) {
    return '☁️';
  } else {
    return '🤷‍';
  }
}

String getBgImage(int condition) {
  if (condition < 300) {
    return 'thunder';
  } else if (condition < 400) {
    return 'drizzle';
  } else if (condition < 600) {
    return 'rain';
  } else if (condition < 700) {
    return 'snow';
  } else if (condition < 800) {
    return 'dust';
  } else if (condition == 800) {
    return 'clear';
  } else if (condition <= 804) {
    return 'cloud';
  } else {
    return '🤷‍';
  }
}

String getMessage(double temp) {
  if (temp > 25) {
    return 'It\'s 🍦 time';
  } else if (temp > 20) {
    return 'Time for shorts and 👕';
  } else if (temp < 10) {
    return 'You\'ll need 🧣 and 🧤';
  } else {
    return 'Bring a 🧥 just in case';
  }
}
