
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class CardWeatherValue extends StatelessWidget {
  const CardWeatherValue({super.key, required this.value, required this.icon, required this.time});
  final String value;
  final Icon icon;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 130,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          icon,
          Text(time),
          Container(
            height: 40,
            width: 40,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  right: 0,
                  child: Text("o", style: TextStyle(fontSize: 10),)),
                Positioned(
                  bottom: 0,
                  child: Text(value, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),))
              ],
            ),
          )
        ],
      ),
    );
  }
}