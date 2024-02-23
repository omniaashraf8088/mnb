import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/cubit/weather_cubit.dart';
import 'package:weather_app/data/models/weather_model.dart';

class WeatherInfoBody extends StatefulWidget {
  const WeatherInfoBody({Key? key, required this.weatherModel,}) : super(key: key);
  final WeatherModel weatherModel;
  @override
  _WeatherInfoBodyState createState() => _WeatherInfoBodyState();
}

class _WeatherInfoBodyState extends State<WeatherInfoBody> {
  @override
  Widget build(BuildContext context) {
    final weatherModel=widget.weatherModel;
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Center(
        child: Container(
          height: size.height,
          width: size.height,
          decoration: BoxDecoration(
            color: isDarkMode ? Colors.black : Colors.white,
          ),
          child: SafeArea(
            child: Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: size.height * 0.01,
                          horizontal: size.width * 0.05,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.bars,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                            Align(
                              child: Text(
                                'Weather App', //TODO: change app name
                                style: GoogleFonts.questrial(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.02,
                                ),
                              ),
                            ),
                            FaIcon(
                              FontAwesomeIcons.plusCircle,
                              color: isDarkMode ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            weatherModel.cityName,
                            style: GoogleFonts.questrial(
                              color: isDarkMode ? Colors.white : Colors.black,
                              fontSize: size.height * 0.06,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Today', //day
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.035,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                        ),
                        child: Align(
                          child: Text(
                            // '$currTemp˚C'
                             'Temp:${weatherModel.temp}', //curent temperature
                            style: GoogleFonts.questrial(
                              color:weatherModel.temp <= 0
                                  ? Colors.blue
                                  : weatherModel.temp > 0 && weatherModel.temp<= 15
                                      ? Colors.indigo
                                      : weatherModel.temp > 15 && weatherModel.temp< 30
                                          ? Colors.deepPurple
                                          : Colors.pink,
                              fontSize: size.height * 0.02,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: size.width * 0.25),
                        child: Divider(
                          color: isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.005,
                        ),
                        child: Align(
                          child: Text(
                            'Sunny', // weather
                            style: GoogleFonts.questrial(
                              color:
                                  isDarkMode ? Colors.white54 : Colors.black54,
                              fontSize: size.height * 0.03,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: size.height * 0.03,
                          bottom: size.height * 0.01,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'MinTemp:${weatherModel.minTemp}', // min temperature
                              style: GoogleFonts.questrial(
                                color: weatherModel.minTemp<= 0
                                    ? Colors.blue
                                    : weatherModel.minTemp > 0 &&weatherModel.minTemp <= 15
                                        ? Colors.indigo
                                        :weatherModel.minTemp > 15 && weatherModel.minTemp< 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              '/',
                              style: GoogleFonts.questrial(
                                color: isDarkMode
                                    ? Colors.white54
                                    : Colors.black54,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                            Text(
                              'MaxTemp:${weatherModel.maxTemp}', //max temperature
                              style: GoogleFonts.questrial(
                                color: weatherModel.maxTemp <= 0
                                    ? Colors.blue
                                    : weatherModel.maxTemp > 0 && weatherModel.maxTemp <= 15
                                        ? Colors.indigo
                                        : weatherModel.maxTemp > 15 && weatherModel.maxTemp < 30
                                            ? Colors.deepPurple
                                            : Colors.pink,
                                fontSize: size.height * 0.03,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: isDarkMode
                                ? Colors.white.withOpacity(0.05)
                                : Colors.black.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.01,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    'Forecast for today',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: Row(
                                    children: [
                                      //TODO: change weather forecast from local to api get
                                      buildForecastToday(
                                        "Now", //hour
                                        weatherModel.data.hour, //temperature
                                        20, //wind (km/h)
                                        0, //rain chance (%)
                                        FontAwesomeIcons.sun, //weather icon
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "15:00",
                                        1,
                                        10,
                                        40,
                                        FontAwesomeIcons.cloud,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "16:00",
                                        0,
                                        25,
                                        80,
                                        FontAwesomeIcons.cloudRain,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "17:00",
                                        -2,
                                        28,
                                        60,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "18:00",
                                        -5,
                                        13,
                                        40,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "19:00",
                                        -8,
                                        9,
                                        60,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "20:00",
                                        -13,
                                        25,
                                        50,
                                        FontAwesomeIcons.snowflake,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "21:00",
                                        -14,
                                        12,
                                        40,
                                        FontAwesomeIcons.cloudMoon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "22:00",
                                        -15,
                                        1,
                                        30,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                      buildForecastToday(
                                        "23:00",
                                        -15,
                                        15,
                                        20,
                                        FontAwesomeIcons.moon,
                                        size,
                                        isDarkMode,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: size.width * 0.05,
                          vertical: size.height * 0.02,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10),
                            ),
                            color: Colors.white.withOpacity(0.05),
                          ),
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.03,
                                  ),
                                  child: Text(
                                    '7-day forecast',
                                    style: GoogleFonts.questrial(
                                      color: isDarkMode
                                          ? Colors.white
                                          : Colors.black,
                                      fontSize: size.height * 0.025,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              Divider(
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                              Padding(
                                padding: EdgeInsets.all(size.width * 0.005),
                                child: Column(
                                  children: [
                                    //TODO: change weather forecast from local to api get
                                    buildSevenDayForecast(
                                      "Today", //day
                                      weatherModel.minTemp.toInt(), //min temperature
                                      weatherModel.maxTemp.toInt(), //max temperature
                                      FontAwesomeIcons.cloud, //weather icon
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Wed",
                                      -5,
                                      5,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Thu",
                                      -2,
                                      7,
                                      FontAwesomeIcons.cloudRain,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Fri",
                                      3,
                                      10,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "San",
                                      5,
                                      12,
                                      FontAwesomeIcons.sun,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Sun",
                                      4,
                                      7,
                                      FontAwesomeIcons.cloud,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Mon",
                                      -2,
                                      1,
                                      FontAwesomeIcons.snowflake,
                                      size,
                                      isDarkMode,
                                    ),
                                    buildSevenDayForecast(
                                      "Tues",
                                      0,
                                      3,
                                      FontAwesomeIcons.cloudRain,
                                      size,
                                      isDarkMode,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildForecastToday(String time, int temp, int wind, int rainChance,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(size.width * 0.025),
      child: Column(
        children: [
          Text(
            time,
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.005,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$temp˚C',
            style: GoogleFonts.questrial(
              color: isDarkMode ? Colors.white : Colors.black,
              fontSize: size.height * 0.025,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.wind,
                  color: Colors.grey,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$wind km/h',
            style: GoogleFonts.questrial(
              color: Colors.grey,
              fontSize: size.height * 0.02,
            ),
          ),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: size.height * 0.01,
                ),
                child: FaIcon(
                  FontAwesomeIcons.umbrella,
                  color: Colors.blue,
                  size: size.height * 0.03,
                ),
              ),
            ],
          ),
          Text(
            '$rainChance %',
            style: GoogleFonts.questrial(
              color: Colors.blue,
              fontSize: size.height * 0.02,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildSevenDayForecast(String time, int minTemp, int maxTemp,
      IconData weatherIcon, size, bool isDarkMode) {
    return Padding(
      padding: EdgeInsets.all(
        size.height * 0.005,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.02,
                ),
                child: Text(
                  time,
                  style: GoogleFonts.questrial(
                    color: isDarkMode ? Colors.white : Colors.black,
                    fontSize: size.height * 0.025,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.25,
                ),
                child: FaIcon(
                  weatherIcon,
                  color: isDarkMode ? Colors.white : Colors.black,
                  size: size.height * 0.03,
                ),
              ),
              Align(
                child: Padding(
                  padding: EdgeInsets.only(
                    left: size.width * 0.15,
                  ),
                  child: Text(
                    '$minTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white38 : Colors.black38,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width * 0.05,
                  ),
                  child: Text(
                    '$maxTemp˚C',
                    style: GoogleFonts.questrial(
                      color: isDarkMode ? Colors.white : Colors.black,
                      fontSize: size.height * 0.025,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Divider(
            color: isDarkMode ? Colors.white : Colors.black,
          ),
        ],
      ),
    );
  }
}
