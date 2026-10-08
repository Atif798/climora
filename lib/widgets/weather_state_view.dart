import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

enum WeatherStateType { loading, empty }

class WeatherStateView extends StatelessWidget {
  final WeatherStateType type;

  const WeatherStateView({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: type == WeatherStateType.loading
            ? _loading()
            : empty(context, colorScheme),
      ),
    );
  }

  Widget _loading() {
    return Column(
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 16),
        Text('Loading weather...', style: AppTheme.stateMessage),
      ],
    );
  }

  Widget empty(BuildContext context, ColorScheme colorScheme) {
    return Column(
      children: [
        Icon(
          Icons.cloud_outlined,
          size: 80,
          color: colorScheme.primary.withValues(alpha: 0.35),
        ),
        const SizedBox(height: 16),
        Text(
          'Search for a city',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(height: 6),
        Text(
          'Your weather information will appear here.',
          textAlign: TextAlign.center,
          style: AppTheme.stateMessage,
        ),
      ],
    );
  }
}