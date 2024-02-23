 import 'package:dio/dio.dart';
import 'package:weather_app/data/models/weather_model.dart';
class WeatherServices{
 final Dio dio;
 final String apiKey='f8850f75ee61412fb5814100241402';
 final String baseUrl='http://api.weatherapi.com/v1';
 //http://api.weatherapi.com/v1/forecast.json?key=f8850f75ee61412fb5814100241402&q=London&days=1&aqi=no&alerts=no
 WeatherServices(this.dio, );
  Future<WeatherModel>getCurrentWeather({required String cityName}) async
  {
    print(cityName);
     try {
       Response response=await dio.get('http://api.weatherapi.com/v1/forecast.json?key=f8850f75ee61412fb5814100241402&q=$cityName&days=1&aqi=no&alerts=no');

       WeatherModel weatherModel=WeatherModel.fromJson(response.data);
       return weatherModel;
     }  on DioException catch (e) {
       print(e);
        final String errorMessage= e.response?.data['error']['message']??'apps there ara ana error';
        throw Exception(errorMessage);
       // TODO
     }
  }
  }


