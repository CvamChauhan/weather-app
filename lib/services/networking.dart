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
    return '๐ฉ';
  } else if (condition < 400) {
    return '๐ง';
  } else if (condition < 600) {
    return 'โ๏ธ';
  } else if (condition < 700) {
    return 'โ๏ธ';
  } else if (condition < 800) {
    return '๐ซ';
  } else if (condition == 800) {
    return 'โ๏ธ';
  } else if (condition <= 804) {
    return 'โ๏ธ';
  } else {
    return '๐คทโ';
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
    return '๐คทโ';
  }
}

String getMessage(double temp) {
  if (temp > 25) {
    return 'It\'s ๐ฆ time';
  } else if (temp > 20) {
    return 'Time for shorts and ๐';
  } else if (temp < 10) {
    return 'You\'ll need ๐งฃ and ๐งค';
  } else {
    return 'Bring a ๐งฅ just in case';
  }
}
