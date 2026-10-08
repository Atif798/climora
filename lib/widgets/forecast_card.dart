import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../core/utils/weather_icon_helper.dart';
import '../../core/utils/temperature_formatter.dart';
import '../../core/utils/date_formatter.dart';
import '../models/daily_forecast_model.dart';
import '../providers/weather_provider.dart';

class ForecastCard extends StatelessWidget {
  final DailyForecastModel forecast;
  final WeatherProvider provider;

  const ForecastCard({
    super.key,
    required this.forecast,
    required this.provider,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    // Weather icon
    final weatherIcon = WeatherIconHelper.get(forecast.condition);
    // Today check
    final isToday = DateFormatter.isToday(forecast.date);

    return Container(
      width: 116,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: isToday ? colorScheme.primary : colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        border: isToday ? null : Border.all(color: AppTheme.borderColor),
        boxShadow: [
          BoxShadow(
            color: isToday
                ? colorScheme.primary.withValues(alpha: 0.20)
                : colorScheme.onSurface.withValues(alpha: 0.03),
            blurRadius: isToday ? 12 : 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // DAY LABEL
          Text(
            DateFormatter.dayLabel(forecast.date),
            style: isToday
                ? AppTheme.forecastDayActive
                : AppTheme.forecastDay,
          ),
          const SizedBox(height: 1),

          // DATE
          Text(
            DateFormatter.dateShort(forecast.date),
            style: isToday
                ? AppTheme.forecastDateActive
                : AppTheme.forecastDate,
          ),
          const SizedBox(height: 5),

          // ICON
          SizedBox(
            width: 40,
            height: 40,
            child: Center(
              child: Icon(
                weatherIcon.icon,
                size: 36,
                color: weatherIcon.color,
              ),
            ),
          ),

          const SizedBox(height: 2),

          // CONDITION
          Text(
            forecast.condition,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: isToday
                ? AppTheme.forecastConditionActive
                : AppTheme.forecastCondition,
          ),
          const SizedBox(height: 5),

          // MAX + MIN TEMP
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                TemperatureFormatter.formatShort(
                  provider,
                  forecast.maxTemperature,
                ),
                style: isToday
                    ? AppTheme.forecastMaxTemperatureActive
                    : AppTheme.forecastMaxTemperature,
              ),
              const SizedBox(width: 5),
              Text(
                TemperatureFormatter.formatShort(
                  provider,
                  forecast.minTemperature,
                ),
                style: isToday
                    ? AppTheme.forecastMinTemperatureActive
                    : AppTheme.forecastMinTemperature,
              ),
            ],
          ),
          const SizedBox(height: 3),

          // AIN PROBABILITY
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.water_drop_outlined,
                size: 12,
                color: isToday
                    ? colorScheme.onPrimary.withValues(alpha: 0.85)
                    : colorScheme.primary,
              ),
              const SizedBox(width: 3),
              Text(
                '${(forecast.precipitationProbability * 100).round()}%',
                style: isToday
                    ? AppTheme.forecastRainProbabilityActive
                    : AppTheme.forecastRainProbability,
              ),
            ],
          ),
        ],
      ),
    );
  }
}