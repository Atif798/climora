import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../core/utils/date_formatter.dart';
import '../core/utils/temperature_formatter.dart';
import '../core/utils/weather_icon_helper.dart';
import '../providers/weather_provider.dart';
import 'weather_info_card.dart';

class CurrentWeatherCard extends StatelessWidget {
  final WeatherProvider provider;

  const CurrentWeatherCard({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final weather = provider.currentWeather!;
    final colorScheme = Theme.of(context).colorScheme;

    //Weather icon mapping
    final weatherIcon = WeatherIconHelper.get(weather.condition);

    return Column(
      children: [
        // Main Gradient Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [colorScheme.primary, colorScheme.primaryContainer],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(22),
            boxShadow: [
              BoxShadow(
                color: colorScheme.primary.withValues(alpha: 0.18),
                blurRadius: 16,
                offset: const Offset(0, 7),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Location + Date
              Row(
                children: [
                  Icon(
                    Icons.location_on_rounded,
                    color: colorScheme.onPrimary,
                    size: 17,
                  ),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text(
                      '${weather.cityName}, ${weather.country}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTheme.weatherLocation,
                    ),
                  ),
                  Text(
                    DateFormatter.fullDate(DateTime.now()),
                    style: AppTheme.weatherDate,
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Icon + Temp + Feels Like
              Row(
                children: [
                  SizedBox(
                    width: 68,
                    height: 68,
                    child: Center(
                      child: Icon(
                        weatherIcon.icon,
                        color: weatherIcon.color,
                        size: 58,
                      ),
                    ),
                  ),

                  const SizedBox(width: 6),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              provider
                                  .convertTemperature(weather.temperature)
                                  .round()
                                  .toString(),
                              style: AppTheme.weatherTemperature,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 2, left: 2),
                              child: Text(
                                provider.isCelsius ? '°C' : '°F',
                                style: AppTheme.weatherUnit,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          formatDescription(weather.description),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTheme.weatherDescription,
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(width: 8),

                  // Feels Like Badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: colorScheme.onPrimary.withValues(alpha: 0.14),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Feels like',
                          style: AppTheme.weatherFeelsLikeLabel,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          TemperatureFormatter.format(provider, weather.feelsLike),
                          style: AppTheme.weatherFeelsLikeValue,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Info Grid
        Row(
          children: [
            Expanded(
              child: WeatherInfoCard(
                icon: Icons.water_drop_outlined,
                label: 'Humidity',
                value: '${weather.humidity}%',
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WeatherInfoCard(
                icon: Icons.air_rounded,
                label: 'Wind',
                value: '${weather.windSpeed.toStringAsFixed(1)} m/s',
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        Row(
          children: [
            Expanded(
              child: WeatherInfoCard(
                icon: Icons.thermostat_rounded,
                label: 'Feels Like',
                value: TemperatureFormatter.format(provider, weather.feelsLike),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: WeatherInfoCard(
                icon: Icons.cloud_outlined,
                label: 'Condition',
                value: weather.condition,
              ),
            ),
          ],
        ),
      ],
    );
  }

  String formatDescription(String description) {
    return description
        .split(' ')
        .map((w) => w.isEmpty ? w : '${w[0].toUpperCase()}${w.substring(1)}')
        .join(' ');
  }
}