import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:level_up/weather_app/model/weather_forecast_model.dart';
import 'package:level_up/weather_app/utils/convert_icons.dart';
import 'package:level_up/weather_app/utils/forecast_util.dart';

Widget midView(AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data;
  var city = snapshot.data!.name;
  var country = snapshot.data!.sys.country;
  var formattedDate =
      new DateTime.fromMillisecondsSinceEpoch(forecastList!.dt * 1000);

  // Image icon_url;
  Container midView = Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$city, $country",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.black,
          ),
        ),
        Text(
          "${Util.getFormattedDate(formattedDate)}",
          style: TextStyle(fontSize: 15),
        ),
        SizedBox(height: 8),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: getWeatherIcon(
            weatherDescription: forecastList.weather[0].main,
            color: Colors.pinkAccent,
            size: 200,
          ),
        ),
        //  icon_url = Image.network(
        //   'http://openweathermap.org/img/w/${forecastList.weather[0].icon}.png',
        //   color: Colors.pinkAccent,
        //   height: 300,
        //   width: 300,
        //   fit: BoxFit.cover,
        // ),
        // Icon(
        //   FontAwesomeIcons.cloud,
        //   size: 200,
        //   color: Colors.pinkAccent,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${forecastList.main.temp}°F",
                style: TextStyle(fontSize: 25),
              ),
              Text(" ${forecastList.weather[0].description}".toUpperCase()),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 12,
            horizontal: 12,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecastList.wind.speed.toStringAsFixed(1)}mi/h"),
                    Icon(
                      FontAwesomeIcons.wind,
                      size: 25,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecastList.main.humidity.toStringAsFixed(0)} %"),
                    Icon(
                      FontAwesomeIcons.solidGrinBeamSweat,
                      size: 25,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("${forecastList.main.tempMax.toStringAsFixed(0)}° F"),
                    Icon(
                      FontAwesomeIcons.temperatureHigh,
                      size: 25,
                      color: Colors.brown,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
  return midView;
}
