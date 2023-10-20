import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:riset_flutter/stepper/controller/stepper_controller.dart';

class StepperScreen extends StatelessWidget {
  const StepperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(StepperController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stepper Screen'),
        centerTitle: true,
      ),
      body: Obx(
        () => Stepper(
          type: StepperType.horizontal,
          physics: const ScrollPhysics(),
          currentStep: controller.currentStep.value,
          onStepTapped: (step) => controller.tapped(step),
          onStepContinue: controller.continued,
          onStepCancel: controller.cancel,
          steps: <Step>[
            Step(
              title: const Text('Account'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Email Address'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Password'),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 0,
              state: controller.currentStep.value >= 0
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: const Text('Address'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Home Address'),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(labelText: 'Postcode'),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 0,
              state: controller.currentStep.value >= 1
                  ? StepState.complete
                  : StepState.disabled,
            ),
            Step(
              title: const Text('Mobile Number'),
              content: Column(
                children: <Widget>[
                  TextFormField(
                    decoration:
                        const InputDecoration(labelText: 'Mobile Number'),
                  ),
                ],
              ),
              isActive: controller.currentStep.value >= 0,
              state: controller.currentStep.value >= 2
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ],
        ),
      ),
    );
  }
}
