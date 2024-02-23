import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/views/home_view.dart';
import 'package:weather_app/presentation/views/splash_view.dart';

void main() {
  runApp(BlocProvider(create: (context){return WeatherCubit();},child: const WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(
      ),
      home: const SplashScreen(),
    );
  }
}
