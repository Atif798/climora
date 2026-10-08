import 'package:flutter/material.dart';
import '../providers/weather_provider.dart';
import 'forecast_card.dart';

class ForecastSection extends StatelessWidget {
  final WeatherProvider provider;

  const ForecastSection({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    final forecasts = provider.forecast;
    if (forecasts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          '5-Day Forecast',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        const SizedBox(height: 12),
        SizedBox(
          height: 175,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: forecasts.length,
            separatorBuilder: (_, __) => const SizedBox(width: 10),
            itemBuilder: (context, index) {
              return ForecastCard(
                forecast: forecasts[index],
                provider: provider,
              );
            },
          ),
        ),
      ],
    );
  }
}