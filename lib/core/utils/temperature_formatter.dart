import '../../providers/weather_provider.dart';

class TemperatureFormatter {
  TemperatureFormatter._();

  // Format temperature with proper unit and rounding
  // e.g. 28.4°C → "28°C"
  static String format(
      WeatherProvider provider,
      double celsius, {
        bool showUnit = true,
      }) {
    final temp = provider.convertTemperature(celsius);
    final unit = provider.isCelsius ? '°C' : '°F';

    final rounded = temp.round().toString();
    return showUnit ? '$rounded$unit' : rounded;
  }

  // Format with degree symbol for forecast cards
  // e.g. 28.4 → "28°"
  static String formatShort(
      WeatherProvider provider,
      double celsius,
      ) {
    final temp = provider.convertTemperature(celsius);
    return '${temp.round()}°';
  }

  // Format with decimal
  // e.g. 28.45°C → "28.5°C"
  static String formatPrecise(
      WeatherProvider provider,
      double celsius,
      ) {
    final temp = provider.convertTemperature(celsius);
    final unit = provider.isCelsius ? '°C' : '°F';
    return '${temp.toStringAsFixed(1)}$unit';
  }
}