class DailyForecastModel {
  final DateTime date;
  final double minTemperature;
  final double maxTemperature;
  final String condition;
  final String description;
  final String icon;
  final double precipitationProbability;

  const DailyForecastModel({
    required this.date,
    required this.minTemperature,
    required this.maxTemperature,
    required this.condition,
    required this.description,
    required this.icon,
    required this.precipitationProbability,
  });
}