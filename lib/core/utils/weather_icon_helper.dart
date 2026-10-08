import 'package:flutter/material.dart';
import '../theme/app_theme.dart';

class WeatherIconData {
  final IconData icon;
  final Color color;

  const WeatherIconData(this.icon, this.color);
}

class WeatherIconHelper {
  WeatherIconHelper._(); // Prevent instantiation

  static WeatherIconData get(String condition) {
    switch (condition.toLowerCase()) {
      case 'clear':
        return const WeatherIconData(
          Icons.wb_sunny_rounded,
          AppTheme.sunnyIconColor,
        );

      case 'clouds':
        return const WeatherIconData(
          Icons.cloud_rounded,
          AppTheme.cloudyIconColor,
        );

      case 'rain':
      case 'drizzle':
        return const WeatherIconData(
          Icons.water_drop_rounded,
          AppTheme.rainyIconColor,
        );

      case 'thunderstorm':
        return const WeatherIconData(
          Icons.thunderstorm_rounded,
          AppTheme.stormIconColor,
        );

      case 'snow':
        return const WeatherIconData(
          Icons.ac_unit_rounded,
          AppTheme.snowIconColor,
        );

      default:
        return const WeatherIconData(
          Icons.blur_on_rounded,
          AppTheme.mistIconColor,
        );
    }
  }
}