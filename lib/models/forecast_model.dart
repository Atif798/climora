class ForecastModel {
  final DateTime dateTime;
  final double temperature;
  final double feelsLike;
  final String condition;
  final String description;
  final String icon;
  final int humidity;
  final double windSpeed;
  final double precipitationProbability;

  const ForecastModel({
    required this.dateTime,
    required this.temperature,
    required this.feelsLike,
    required this.condition,
    required this.description,
    required this.icon,
    required this.humidity,
    required this.windSpeed,
    required this.precipitationProbability,
  });

  factory ForecastModel.fromJson(Map<String, dynamic> json) {
    final main = json['main'] as Map<String, dynamic>;
    final weather = (json['weather'] as List).first as Map<String, dynamic>;
    final wind = json['wind'] as Map<String, dynamic>;

    return ForecastModel(
      dateTime: DateTime.parse(json['dt_txt'] as String),
      temperature: (main['temp'] as num).toDouble(),
      feelsLike: (main['feels_like'] as num).toDouble(),
      condition: weather['main'] as String,
      description: weather['description'] as String,
      icon: weather['icon'] as String,
      humidity: main['humidity'] as int,
      windSpeed: (wind['speed'] as num).toDouble(),
      precipitationProbability:
      ((json['pop'] as num?) ?? 0).toDouble(),
    );
  }
}