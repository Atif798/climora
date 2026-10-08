import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/weather_provider.dart';
import '../widgets/weather_header.dart';
import '../widgets/weather_search_bar.dart';
import '../widgets/current_weather_card.dart';
import '../widgets/forecast_section.dart';
import '../widgets/weather_state_view.dart';
import '../widgets/weather_error_view.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadLastSearchedCity();
  }

  @override
  void dispose() {
    cityController.dispose();
    super.dispose();
  }

//
  Future<void> loadLastSearchedCity() async {
    final preferences = await SharedPreferences.getInstance();
    final lastCity = preferences.getString('last_searched_city');

    if (!mounted || lastCity == null || lastCity.isEmpty) return;

    cityController.text = lastCity;
    await context.read<WeatherProvider>().fetchWeather(lastCity);
  }

  Future<void> searchWeather() async {
    final city = cityController.text.trim();

    if (city.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a city name.',textAlign: TextAlign.center,)),
      );
      return;
    }

    FocusScope.of(context).unfocus();
    await context.read<WeatherProvider>().fetchWeather(city);
  }

  Future<void> refreshWeather() async {
    final city = cityController.text.trim();
    if (city.isEmpty) return;
    await context.read<WeatherProvider>().fetchWeather(city);
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WeatherProvider>();
    final status = provider.status;

    return Scaffold(
      body: SafeArea(
        top: false,
        child: RefreshIndicator(
          onRefresh: refreshWeather,
          child: SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                WeatherHeader(
                  isCelsius: provider.isCelsius,
                  onUnitToggle: provider.toggleTemperatureUnit,
                  child: WeatherSearchBar(
                    controller: cityController,
                    onSearch: searchWeather,
                    onChanged: (_) => setState(() {}),
                  ),
                ),

                // BODY
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 16, 20, 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (status == WeatherStatus.loading)
                        const WeatherStateView(
                          type: WeatherStateType.loading,
                        )
                      else if (status == WeatherStatus.success)
                        Column(
                          children: [
                            CurrentWeatherCard(provider: provider),
                            ForecastSection(provider: provider),
                          ],
                        )
                      else if (status == WeatherStatus.error)
                          WeatherErrorView(
                            errorMessage: provider.errorMessage,
                            onRetry: () {
                              final city = cityController.text.trim();
                              if (city.isNotEmpty) searchWeather();
                            },
                          )
                        else
                          const WeatherStateView(
                            type: WeatherStateType.empty,
                          ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}