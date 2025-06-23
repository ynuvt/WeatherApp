import 'package:flutter/material.dart';

class AdditionalWeatherInfo extends StatelessWidget {
  const AdditionalWeatherInfo({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherInfoItem(
                icon: Icons.opacity,
                title: 'Humidity',
                value: '65%',
              ),
              WeatherInfoItem(icon: Icons.air, title: 'Wind', value: '8 mph'),
            ],
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WeatherInfoItem(
                icon: Icons.speed,
                title: 'Pressure',
                value: '1012 hPa',
              ),
              WeatherInfoItem(
                icon: Icons.visibility,
                title: 'Visibility',
                value: '10 mi',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class WeatherInfoItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  WeatherInfoItem({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: Colors.white, size: 30),
        SizedBox(height: 8),
        Text(
          title,
          style: TextStyle(
            color: Colors.white.withValues(red: 0.8),
            fontSize: 14,
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
