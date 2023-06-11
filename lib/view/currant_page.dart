

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../components/card_weather_value.dart';
import '../controller/theweather.dart';
import '../controller/ui_controllers/move_on.dart';

class CurrantPage extends StatelessWidget {
  const CurrantPage({super.key});

  @override
  Widget build(BuildContext context) {
    TheWeather weatherController = Get.put(TheWeather());
    MoveOn moveonController = Get.put(MoveOn());
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            bottom: 150,
            right: 0,
            left: 0,
            child: Image.asset("assets/beautiful-mountains.jpg", fit: BoxFit.cover,)
          ),
          Builder(
            builder: (context) {
              return Obx(() => AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                top: moveonController.top.value,
                left: 20,
                right: 20,
                height: MediaQuery.of(context).size.width,
                child:Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    // color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: const [
                      BoxShadow(offset: Offset(2, 2), blurRadius: 5, color: Colors.black38),
                    ]
                  ),
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                    ), 
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border.all(width: 2, color: Colors.black12),
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey
                        ),
                      );
                    },
                  )
                ),
              ));
            }
          ),
          Positioned(
            top: 100,
            left: 20,
            right: 20,
            height: 100,
            child: Container(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 110,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 0,
                          child: Text("30",style: TextStyle(fontSize: 100, color: Colors.white, fontWeight: FontWeight.w300),),
                        ),
                        Positioned(
                          top: 0,
                          right: 0,
                          child: Text("o",style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${DateTime.now().year} / ${DateTime.now().month} / ${DateTime.now().day}", style: const TextStyle(color: Colors.white),),
                        Icon(Icons.sunny, color: Colors.yellow, size: 40,),
                        Text("it's Sunny", style: TextStyle(fontSize: 22, color: Colors.white, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic, )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            height: 200,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(child: Text("Weather Today", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      CardWeatherValue(
                        icon: Icon(Icons.sunny, size: 35,),
                        time: "11:22",
                        value: "23",
                      ),
                      CardWeatherValue(
                        icon: Icon(Icons.sunny_snowing, color: Colors.yellow,size: 35,),
                        time: "11:22",
                        value: "23",
                      ),
                      CardWeatherValue(
                        icon: Icon(Icons.sunny, size: 35,),
                        time: "11:22",
                        value: "23",
                      ),
                      CardWeatherValue(
                        icon: Icon(Icons.wb_sunny_outlined, size: 35,),
                        time: "11:22",
                        value: "23",
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),

          Positioned(
            top: 50,
            right: 20,
            left: 20,
            child: Container(
              child: Obx(() => weatherController.thisPosition.isEmpty
              ?  CircularProgressIndicator()
              : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: Icon(Icons.location_on_outlined, color: Colors.white,),
                          ),
                          Text("${weatherController.thisPosition[0].namecity}",style: TextStyle(fontSize: 25, color: Colors.white, fontStyle: FontStyle.italic, letterSpacing: 2),)
                        ],
                      ),
                      IconButton(onPressed: (){
                        moveonController.moveOnTop();
                      }, icon: const Icon(Icons.menu, color: Colors.white, size: 30,shadows: [
                        Shadow(color: Colors.black26,offset: Offset(4, 4), blurRadius: 5)
                      ],)),
                    ],
                  )
                ],
              )
            )
            ),
          ),
          
        ],
      )
    );
  }
}