import 'package:flutter/material.dart';
import 'package:level_up/weather_app/model/weather_forecast_model.dart';
import 'package:level_up/weather_app/ui/forecast_card.dart';

Widget bottomView(
    BuildContext context, AsyncSnapshot<WeatherForecastModel> snapshot) {
  var forecastList = snapshot.data;
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Text("7-Day Weather Forecast".toUpperCase(),
          style: TextStyle(
            fontSize: 15,
            color: Colors.black87,
          )),
      Container(
          height: 165,
          padding: EdgeInsets.symmetric(
            vertical: 16,
            horizontal: 10,
          ),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => SizedBox(
              width: 8,
            ),
            itemCount: forecastList!.base.length,
            itemBuilder: (context, index) => ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              child: Container(
                width: MediaQuery.of(context).size.width / 2.7,
                height: 170,
                child: forecastCard(snapshot, index),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 119, 97, 156),
                    Colors.white,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                )),
              ),
            ),
          )),
    ],
  );
}
