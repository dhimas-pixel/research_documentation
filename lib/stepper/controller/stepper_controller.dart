import 'dart:developer';

import 'package:get/get.dart';

class StepperController extends GetxController {
  static StepperController get to => Get.find();

  Rx<int> currentStep = 0.obs;

  tapped(int step) {
    currentStep.value = step;
  }

  continued() {
    log('message');
    currentStep.value < 2 ? currentStep.value += 1 : null;
  }

  cancel() {
    currentStep.value > 0 ? currentStep.value -= 1 : null;
  }
}
