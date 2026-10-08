import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

class WeatherSearchBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback onSearch;
  final ValueChanged<String>? onChanged;

  const WeatherSearchBar({
    super.key,
    required this.controller,
    required this.onSearch,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      children: [
        // TextField
        Expanded(
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            child: Container(
              height: 54,
              decoration: BoxDecoration(
                color: colorScheme.surface,
                boxShadow: [
                  BoxShadow(
                    color: colorScheme.onSurface.withValues(alpha: 0.08),
                    blurRadius: 12,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: TextField(
                controller: controller,
                textInputAction: TextInputAction.search,
                onSubmitted: (_) => onSearch(),
                onChanged: onChanged,
                style: AppTheme.weatherSearchInput,
                decoration: InputDecoration(
                  hintText: 'Enter city name',
                  hintStyle: AppTheme.weatherSearchHint,
                  prefixIcon: Icon(
                    Icons.location_on_outlined,
                    color: colorScheme.onSurfaceVariant,
                    size: 20,
                  ),
                  suffixIcon: controller.text.isNotEmpty
                      ? IconButton(
                    onPressed: () {
                      controller.clear();
                      onChanged?.call('');
                    },
                    icon: Icon(
                      Icons.close_rounded,
                      color: colorScheme.onSurfaceVariant,
                      size: 18,
                    ),
                  )
                      : null,
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 17,
                    horizontal: 8,
                  ),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(width: 7),

        // Search Button
        GestureDetector(
          onTap: onSearch,
          child: Container(
            height: 54,
            width: 54,
            decoration: BoxDecoration(
              color: colorScheme.onPrimary.withValues(alpha: 0.20),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(15),
                bottomRight: Radius.circular(15),
              ),
              boxShadow: [
                BoxShadow(
                  color: colorScheme.primary.withValues(alpha: 0.25),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Icon(
              Icons.search_rounded,
              color: colorScheme.onPrimary,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}