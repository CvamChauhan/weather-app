import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:weather/services/location.dart';
import 'package:weather/services/networking.dart';
import 'package:weather/screens/city.dart';

String openweathermap = "https://api.openweathermap.org/data/2.5/weather";
String apikey = "577ac7217d02d1e7e6690985ca5d918e";

class LocationScreen extends StatefulWidget {
  dynamic weatherdata;
  LocationScreen({this.weatherdata});
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  String? temperature;
  int? condition;
  String? weather;
  String? countryName;
  String? cityName;
  String? weatherIcon;
  String? weatherMessage;
  String? bgImage;
  @override
  void initState() {
    super.initState();
    updateUI(widget.weatherdata);
  }

  updateUI(dynamic weatherData) {
    if (weatherData == null) {
      temperature = "0";
      weatherIcon = 'Error';
      weatherMessage = 'Unable to get weather data';
      cityName = '';
      countryName = " ";
      return;
    }
    double temp = weatherData['main']['temp'];
    temperature = temp.toStringAsFixed(0);
    weather = weatherData['weather'][0]['main'];
    condition = weatherData['weather'][0]['id'];
    cityName = weatherData['name'];
    countryName = weatherData['sys']['country'];
    weatherIcon = getWeatherIcon(condition!);
    bgImage = getBgImage(condition!);
    weatherMessage = getMessage(temp);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/$bgImage.jpg"),
            ),
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () async {
                        dynamic weatherdata =
                            await Location().getCurrLocation();
                        setState(() {
                          updateUI(weatherdata);
                        });
                      },
                      icon: const Icon(
                        Icons.near_me,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                    const Expanded(child: SizedBox()),
                    IconButton(
                      onPressed: () async {
                        dynamic future = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const City()));
                        if (future == null) {
                          print(future);
                        } else {
                          dynamic weatherData = await FetchData(
                                  "$openweathermap?q=$future&appid=$apikey&units=metric")
                              .getData();
                          setState(() {
                            updateUI(weatherData);
                          });
                        }
                      },
                      icon: const Icon(
                        Icons.location_city,
                        color: Colors.white,
                        size: 40,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "Currently",
                        style: TextStyle(
                            color: Colors.white, fontStyle: FontStyle.italic),
                      ),
                      const SizedBox(
                        width: 6,
                      ),
                      Text(
                        "$temperature℃",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 90,
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    "$weatherIcon $weather",
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 40),
                  ),
                ),
                const SizedBox(height: 30),
                Padding(
                  padding: const EdgeInsets.only(right: 120),
                  child: Text(
                    "$cityName, $countryName",
                    textAlign: TextAlign.right,
                    style: const TextStyle(color: Colors.white, fontSize: 25),
                  ),
                ),
                const SizedBox(height: 60),
                Text(
                  "$weatherMessage",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      shadows: [Shadow(color: Colors.black, blurRadius: 5)],
                      color: Colors.white,
                      fontSize: 25),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
