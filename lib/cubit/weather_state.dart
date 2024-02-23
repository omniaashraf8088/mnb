part of 'weather_cubit.dart';
@immutable
abstract class WeatherState {}

class WeatherInitialState extends WeatherState {}
class WeatherLoadedState extends WeatherState {
  final WeatherModel weatherModel;

  WeatherLoadedState(WeatherModel this.weatherModel);
}
class WeatherErrorState extends WeatherState {
  final String error;
  WeatherErrorState({required this.error});
}
