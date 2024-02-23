import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/data/models/weather_model.dart';
import 'package:weather_app/data/network_services/weather_services.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('Search city '),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            onSubmitted:(value)async{
              var getWeatherCubit = BlocProvider.of<WeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              contentPadding:const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 32
              ),
              labelText:'search',
              suffixIcon: const Icon(Icons.search),
              suffixIconColor: Colors.pinkAccent,
              hintText: 'Enter city name ',
              border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.pink),
                borderRadius: BorderRadius.circular(16),
              ),

            ),
          ),
        ),
      ),
    );
  }
}
