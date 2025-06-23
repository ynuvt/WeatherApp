import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:weatherapp/03current_weather_card.dart';
import 'package:weatherapp/04forecast_card.dart';
import 'package:weatherapp/05additional_weather_info.dart';
import 'package:http/http.dart' as http;

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreen();
}

//api key : 7467bfb1c6ed64690fdc701bdca1ba16

class _WeatherScreen extends State<WeatherScreen> {
  //current weather Function//
  Future<Map<String, dynamic>> currentWeather() async {
    late final res;
    late bool isWeather;
    try {
      res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?q=Mumbai,india&APPID=cae7b16abc35eed38bc5bfd4194ac1e9',
        ),
      );
      final weather = jsonDecode(res.body);
      if (weather['cod'] != 200) {
        isWeather = false;
        throw 'An Unexpected Error Occured';
      }
      return weather;
    } catch (e) {
      throw e.toString();
    }
  }

  // REMEMBER THE CHANGES IN THE INIT STATE -- FOR PRINTING THE VALUES//
  //@override
  // void initState() {
  //   super.initState();
  //   setState(() {
  //     final data = currentWeather();
  //     print(data.toString());
  //   });
  //   print('init intialized');
  // }

  @override
  void initState() {
    super.initState();
    final data = currentWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue.shade800,
              Colors.blue.shade600,
              Colors.blue.shade400,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // Header with location
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.location_on, color: Colors.white, size: 20),
                    SizedBox(width: 8),
                    Text(
                      'New York, USA',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),

              // Current weather card
              CurrentWeatherCard(),

              SizedBox(height: 20),

              // Forecast horizontal scroll
              ForecastCards(),

              SizedBox(height: 20),

              // Additional weather info
              AdditionalWeatherInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
