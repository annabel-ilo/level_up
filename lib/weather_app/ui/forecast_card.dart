import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:level_up/weather_app/model/weather_forecast_model.dart';
import 'package:level_up/weather_app/utils/convert_icons.dart';
import 'package:level_up/weather_app/utils/forecast_util.dart';

Widget forecastCard(AsyncSnapshot<WeatherForecastModel> snapshot, int index) {
  var forecastList = snapshot.data;
  var dayOfWeek = " ";
  var date = new DateTime.fromMillisecondsSinceEpoch(forecastList!.dt * 1000);
  var fullDate = Util.getFormattedDate(date);
  dayOfWeek = fullDate.split(" , ").elementAt(0);

  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(dayOfWeek),
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 33,
            backgroundColor: Colors.white,
            child: getWeatherIcon(
              weatherDescription: forecastList.weather[0].main,
              color: Colors.pinkAccent,
              size: 45,
            ),
          ),
          SizedBox(width: 3),
          Column(
            children: [
              Row(
                children: [
                  Text("${forecastList.main.tempMin.toStringAsFixed(0)}° F"),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleDown,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
              Row(
                children: [
                  Text("${forecastList.main.tempMax.toStringAsFixed(0)}° F"),
                  Icon(
                    FontAwesomeIcons.solidArrowAltCircleUp,
                    color: Colors.white,
                    size: 18,
                  ),
                ],
              ),
              Text("Hum${forecastList.main.humidity.toStringAsFixed(0)} %"),
              Text("win${forecastList.wind.speed.toStringAsFixed(1)}mi/h")
            ],
          )
        ],
      )
    ],
  );
}
