import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class WeatherHeader extends StatelessWidget {
  final bool isCelsius;
  final VoidCallback onUnitToggle;
  final Widget child;

  const WeatherHeader({
    super.key,
    required this.isCelsius,
    required this.onUnitToggle,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.fromLTRB(
        20,
        MediaQuery.of(context).padding.top + 16,
        20,
        28,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            colorScheme.primaryContainer,
            colorScheme.primary,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
        boxShadow: [
          BoxShadow(
            color: colorScheme.primary.withValues(alpha: 0.20),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top Row: Logo + Brand + Unit Toggle
          Row(
            children: [
              Container(
                height: 46,
                width: 46,
                decoration: BoxDecoration(
                  color: colorScheme.onPrimary.withValues(alpha: 0.20),
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: colorScheme.onPrimary.withValues(alpha: 0.25),
                  ),
                ),
                child: Icon(
                  Icons.cloud_rounded,
                  color: colorScheme.onPrimary,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text('Climora', style: AppTheme.weatherBrand),
              ),
              UnitToggle(
                isCelsius: isCelsius,
                onToggle: onUnitToggle,
              ),
            ],
          ),

          const SizedBox(height: 10),

          // Title
          Text(
            'Check the weather',
            style: AppTheme.weatherHeaderTitle,
          ),
          const SizedBox(height: 6),
          Text(
            'Search any city for real-time updates',
            style: AppTheme.weatherHeaderSubtitle,
          ),

          const SizedBox(height: 22),

          // Search Bar
          child,
        ],
      ),
    );
  }
}


class UnitToggle extends StatelessWidget {
  final bool isCelsius;
  final VoidCallback onToggle;

  const UnitToggle({
    required this.isCelsius,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: colorScheme.onPrimary.withValues(alpha: 0.18),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: colorScheme.onPrimary.withValues(alpha: 0.25),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          chip('°C', isCelsius, () {
            if (!isCelsius) onToggle();
          }),
          chip('°F', !isCelsius, () {
            if (isCelsius) onToggle();
          }),
        ],
      ),
    );
  }

  Widget chip(String label, bool isActive, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOut,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: isActive ? AppTheme.onPrimaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(9),
        ),
        child: Text(
          label,
          style: isActive
              ? AppTheme.weatherUnitActive
              : AppTheme.weatherUnitInactive,
        ),
      ),
    );
  }
}