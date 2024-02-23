import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/presentation/views/search_view.dart';
import '../widget/no_weather_body.dart';
import '../widget/weather_info_body.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context){
              return const SearchView();
            }),) ;
          }, icon: const Icon(Icons.search_rounded)),

      ],
        title: const Text('Weather App'),centerTitle:true,
      ),
      body: BlocBuilder<WeatherCubit,WeatherState>(builder:(context,state) {
        if (state is WeatherInitialState) {
          return const NoWeatherBody();
        }
        else if (state is WeatherLoadedState) {
          return WeatherInfoBody(weatherModel: state.weatherModel);
        }
        else if  (state is WeatherErrorState) {
          return  Text(state.error);
        }
        else{
          return  const Text('unknown');
        }
      }
      ),
    );
  }
}
