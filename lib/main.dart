import 'package:appweather/view/currant_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';

import 'controller/peimessions.dart';

void main() async{
  await dotenv.load(fileName: ".env");
  runApp(
    const GetMaterialApp(
      home: MyApp(),
      title: "MyApp",
    )
  );
}



class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GeoLocatorPermmissions permmissionsGeo = Get.put(GeoLocatorPermmissions());

    return const CurrantPage();
  }
}