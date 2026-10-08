import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import '../core/constants/api_constants.dart';

class WeatherApiService {
  final Dio _dio = Dio(

    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
    ),
  );
  String get _apiKey {
    final apiKey = dotenv.env['WEATHER_API_KEY'];

    if (apiKey == null || apiKey.isEmpty) {
      throw Exception('Weather API key is missing.');
    }

    return apiKey;
  }

  Future<Map<String, dynamic>> getCurrentWeather(String city) async {
    final apiKey = _apiKey;

    try {
      final response = await _dio.get(
        ApiConstants.currentWeatherEndpoint,
        queryParameters: {
          'q': city,
          'units': 'metric',
          'appid': apiKey,
        },
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('City not found.');
      }

      if (e.response?.statusCode == 401) {
        throw Exception('Invalid weather API key.');
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your network.',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Request timed out. Please try again.',
        );
      }

      throw Exception(
        'Unable to fetch weather data. Please try again.',
      );
    }
  }
  //
  Future<Map<String, dynamic>> getForecast(String city) async {
    final apiKey = _apiKey;

    try {
      final response = await _dio.get(
        ApiConstants.forecastEndpoint,
        queryParameters: {
          'q': city,
          'units': 'metric',
          'appid': apiKey,
        },
      );

      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      if (e.response?.statusCode == 404) {
        throw Exception('City not found.');
      }

      if (e.response?.statusCode == 401) {
        throw Exception('Invalid weather API key.');
      }

      if (e.type == DioExceptionType.connectionError) {
        throw Exception(
          'No internet connection. Please check your network.',
        );
      }

      if (e.type == DioExceptionType.connectionTimeout ||
          e.type == DioExceptionType.receiveTimeout) {
        throw Exception(
          'Request timed out. Please try again.',
        );
      }

      throw Exception(
        'Unable to fetch forecast data. Please try again.',
      );
    }
  }
}