import 'package:flutter/material.dart';
import 'package:level_up/weather_app/model/weather_forecast_model.dart';
import 'package:level_up/weather_app/network/forecast_network.dart';
import 'package:level_up/weather_app/ui/bottom_view.dart';

import 'mid_view.dart';

class WeatherForecast extends StatefulWidget {
  const WeatherForecast({Key? key}) : super(key: key);

  @override
  _WeatherForecastState createState() => _WeatherForecastState();
}

class _WeatherForecastState extends State<WeatherForecast> {
  late Future<WeatherForecastModel> forecastObject;
  String _cityName = "Lagos";

  @override
  void initState() {
    super.initState();
    forecastObject = getWeather(cityName: _cityName);
  }

  // forecastObject.then((weather) {
  //     print(weather.main);
  //   });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        textFieldView(),
        Container(
          child: FutureBuilder<WeatherForecastModel>(
              future: forecastObject,
              builder: (BuildContext context,
                  AsyncSnapshot<WeatherForecastModel> snapshot) {
                if (snapshot.hasData) {
                  return Column(
                    children: [
                      midView(snapshot),
                      bottomView(context, snapshot),
                    ],
                  );
                } else {
                  return Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        )
      ]),
    );
  }

  Widget textFieldView() {
    return Container(
        margin: EdgeInsets.all(10),
        child: TextField(
          decoration: InputDecoration(
              hintText: "Enter City Name",
              prefixIcon: Icon(Icons.search),
              contentPadding: EdgeInsets.all(8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
              )),
          onSubmitted: (value) {
            setState(() {
              _cityName = value;
              forecastObject = getWeather(cityName: _cityName);
            });
          },
        ));
  }

  Future<WeatherForecastModel> getWeather({required String cityName}) =>
      new Networka().getWeatherForecast(cityName: _cityName);
}
