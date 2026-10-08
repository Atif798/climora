import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/current_weather_model.dart';
import '../models/daily_forecast_model.dart';
import '../models/forecast_model.dart';
import '../services/weather_api_service.dart';

enum WeatherStatus {
  initial,
  loading,
  success,
  error,
}

class WeatherProvider extends ChangeNotifier {
  final WeatherApiService _weatherApiService = WeatherApiService();

  WeatherStatus _status = WeatherStatus.initial;
  CurrentWeatherModel? _currentWeather;
  List<DailyForecastModel> _forecast = [];
  String? _errorMessage;

  WeatherStatus get status => _status;
  CurrentWeatherModel? get currentWeather => _currentWeather;
  List<DailyForecastModel> get forecast => _forecast;
  String? get errorMessage => _errorMessage;

  bool _isCelsius = true;
  bool get isCelsius => _isCelsius;
  void toggleTemperatureUnit() {
    _isCelsius = !_isCelsius;
    notifyListeners();
  }
  //
  double convertTemperature(double celsius) {
    if (_isCelsius) {
      return celsius;
    }

    return (celsius * 9 / 5) + 32;
  }
  //

  Future<void> fetchWeather(String city) async {
    if (city.trim().isEmpty) {
      _status = WeatherStatus.error;
      _errorMessage = 'Please enter a city name.';
      notifyListeners();
      return;
    }

    _status = WeatherStatus.loading;
    _errorMessage = null;
    _currentWeather = null;
    _forecast = [];
    notifyListeners();

    try {
      final results = await Future.wait([
        _weatherApiService.getCurrentWeather(city.trim()),
        _weatherApiService.getForecast(city.trim()),
      ]);

      final currentWeatherJson = results[0];

      final forecastJson = results[1];

      final forecastList =
      forecastJson['list'] as List<dynamic>;

      _currentWeather =
          CurrentWeatherModel.fromJson(currentWeatherJson);

      final allForecasts = forecastList
          .map(
            (item) => ForecastModel.fromJson(
          item as Map<String, dynamic>,
        ),
      )
          .toList();

      _forecast = _buildDailyForecast(allForecasts);
      final preferences = await SharedPreferences.getInstance();
      await preferences.setString(
        'last_searched_city',
        city.trim(),
      );
      _status = WeatherStatus.success;
    } catch (e) {
      _status = WeatherStatus.error;
      _errorMessage = e.toString().replaceFirst('Exception: ', '');
    }

    notifyListeners();
  }
  //
  List<DailyForecastModel> _buildDailyForecast(
      List<ForecastModel> forecasts,
      ) {
    final Map<String, List<ForecastModel>> groupedForecasts = {};

    for (final forecast in forecasts) {
      final dateKey =
          '${forecast.dateTime.year}-'
          '${forecast.dateTime.month.toString().padLeft(2, '0')}-'
          '${forecast.dateTime.day.toString().padLeft(2, '0')}';

      groupedForecasts.putIfAbsent(dateKey, () => []).add(forecast);
    }

    final dailyForecasts = <DailyForecastModel>[];

    for (final dailyItems in groupedForecasts.values.take(5)) {
      final minTemperature = dailyItems
          .map((item) => item.temperature)
          .reduce((a, b) => a < b ? a : b);

      final maxTemperature = dailyItems
          .map((item) => item.temperature)
          .reduce((a, b) => a > b ? a : b);

      final representative = dailyItems[dailyItems.length ~/ 2];

      final maxRainProbability = dailyItems
          .map((item) => item.precipitationProbability)
          .reduce((a, b) => a > b ? a : b);

      dailyForecasts.add(
        DailyForecastModel(
          date: representative.dateTime,
          minTemperature: minTemperature,
          maxTemperature: maxTemperature,
          condition: representative.condition,
          description: representative.description,
          icon: representative.icon,
          precipitationProbability: maxRainProbability,
        ),
      );
    }

    return dailyForecasts;
  }
}