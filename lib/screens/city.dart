import 'package:flutter/material.dart';

class City extends StatefulWidget {
  const City({Key? key}) : super(key: key);

  @override
  _CityState createState() => _CityState();
}

class _CityState extends State<City> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage("images/city.jpg"),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back_ios,
                  size: 40,
                  color: Colors.white,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 15, 40),
                child: TextField(
                  cursorColor: Colors.black,
                  onChanged: (value) {
                    setState(() {
                      cityName = value;
                    });
                  },
                  decoration: InputDecoration(
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    focusColor: Colors.black,
                    icon: const Icon(
                      Icons.location_city,
                      color: Colors.white,
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Colors.pink,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    hintText: 'Enter city name',
                  ),
                ),
              ),
              Center(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context, cityName);
                      },
                      child: const Text(
                        "Get Weather",
                        style: TextStyle(
                            color: Colors.white,
                            backgroundColor: Colors.black38,
                            fontSize: 30),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
