

import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

import '../model/Weather.dart';


class TheWeather extends GetxController {

  double atut = 0.0;
  double longt = 0.0;

  TheWeather() {
    getWeather();
  }

  List currantweather = [].obs;

  List<Weather> thisPosition = [
    Weather(
        namecity: "",
        country: "",
        pressure: 0, 
        humidity: 0, 
        sealavel: 0, 
        grndlavel: 0, 
        visibility: 0, 
        windspeed: 0, 
        winddeg: 0, 
        widgust: 0, 
        sunrise: 0, 
        sunset: 0,
      )
  ].obs;

  static var apikey = dotenv.env['API_KEY'];
  Future<void> getWeather() async {
    thisPosition.clear();
    await getlongandatut();
    final url = Uri.parse('https://api.openweathermap.org/data/2.5/weather?lat=$atut&lon=$longt&appid=$apikey');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      currantweather.add(jsonDecode(response.body));
      Weather weather = Weather(
        namecity: currantweather[0]['name'],
        country: currantweather[0]['sys']['country'],
        pressure: currantweather[0]['main']['pressure'], 
        humidity: currantweather[0]['main']['humidity'], 
        sealavel: currantweather[0]['main']['sea_level'], 
        grndlavel: currantweather[0]['main']['grnd_level'], 
        visibility: currantweather[0]['visibility'], 
        windspeed: currantweather[0]['wind']['speed'], 
        winddeg: currantweather[0]['wind']['deg'], 
        widgust: currantweather[0]['wind']['gust'], 
        sunrise: currantweather[0]['sys']['sunrise'], 
        sunset: currantweather[0]['sys']['sunset'],
      );
      thisPosition.add(weather);
    } else {
      throw Exception('Failed to: ${response.reasonPhrase}');
    }
  }

  Future<void> getlongandatut() async {
    Position po = await Geolocator.getCurrentPosition().then((value) => value);
    atut = po.latitude;
    longt = po.longitude;
  }
}