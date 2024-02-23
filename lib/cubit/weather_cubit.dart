import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/network_services/weather_services.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(WeatherInitialState());
  WeatherModel? weatherModel;

  getWeather({required String cityName})async
{
  try {
    WeatherModel weatherModel=await WeatherServices(Dio()).getCurrentWeather(cityName:cityName);
    emit(WeatherLoadedState(weatherModel));
  } catch (e) {
    emit(WeatherErrorState(error: e.toString()));
    // TODO
  }
}

}
