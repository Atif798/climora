import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class WeatherErrorView extends StatelessWidget {
  final String? errorMessage;
  final VoidCallback onRetry;

  const WeatherErrorView({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: [
            Icon(
              Icons.cloud_off_outlined,
              size: 70,
              color: colorScheme.error.withValues(alpha: 0.70),
            ),
            const SizedBox(height: 16),
            Text(
              'Weather unavailable',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 8),
            Text(
              errorMessage ?? 'Something went wrong.',
              textAlign: TextAlign.center,
              style: AppTheme.errorMessage,
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: onRetry,
              icon: const Icon(Icons.refresh),
              label: const Text('Try Again'),
            ),
          ],
        ),
      ),
    );
  }
}