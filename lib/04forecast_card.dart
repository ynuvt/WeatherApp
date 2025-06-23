import 'package:flutter/material.dart';

class ForecastCards extends StatelessWidget {
  ForecastCards({super.key});
  final List<Map<String, dynamic>> forecastData = [
    {'day': 'Mon', 'icon': Icons.wb_sunny, 'temp': '72°'},
    {'day': 'Tue', 'icon': Icons.cloud, 'temp': '68°'},
    {'day': 'Wed', 'icon': Icons.grain, 'temp': '65°'},
    {'day': 'Thu', 'icon': Icons.wb_sunny, 'temp': '70°'},
    {'day': 'Fri', 'icon': Icons.thunderstorm, 'temp': '62°'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: forecastData.length,
        itemBuilder: (context, index) {
          return Container(
            width: 80,
            margin: EdgeInsets.symmetric(horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  forecastData[index]['day'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                Icon(
                  forecastData[index]['icon'],
                  color: Colors.white,
                  size: 30,
                ),
                SizedBox(height: 8),
                Text(
                  forecastData[index]['temp'],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
