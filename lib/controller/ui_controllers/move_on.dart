

import 'package:get/get.dart';

class MoveOn extends GetxController {
  RxDouble top = 1000.0.obs;
  Rx<DateTime> da = DateTime.now().obs;
  void moveOnTop() {
    top.value = top.value < 1000.0 ? 1000.0 : 230.0;
  }
}