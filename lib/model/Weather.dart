

import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Weather {
  String namecity;
  String country;
  int pressure;
  int humidity;
  int sealavel;
  int grndlavel;
  int visibility;
  double windspeed;
  int winddeg;
  double widgust;
  int sunrise;
  int sunset;


  Weather({
    required this.namecity,
    required this.country,
    required this.pressure,
    required this.humidity,
    required this.sealavel,
    required this.grndlavel,
    required this.visibility,
    required this.windspeed,
    required this.winddeg,
    required this.widgust,
    required this.sunrise,
    required this.sunset,
  });

}