import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

Widget getWeatherIcon({
  required String weatherDescription,
  required Color color,
  required double size,
}) {
  switch (weatherDescription) {
    case "Clear":
      {
        return Icon(FontAwesomeIcons.sun, color: color, size: size);
      }
      // ignore: dead_code
      break;
    case "Cloud":
      {
        return Icon(FontAwesomeIcons.cloud, color: color, size: size);
      }
    case "Rain":
      {
        return Icon(FontAwesomeIcons.cloudRain, color: color, size: size);
      }
    case "Snow":
      {
        return Icon(FontAwesomeIcons.snowman, color: color, size: size);
      }
    default:
      {
        return Icon(FontAwesomeIcons.rainbow, color: color, size: size);
      }
  }
}
