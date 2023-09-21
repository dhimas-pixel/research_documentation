import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static QrCodeController get to => Get.find();

  //* Controllers and Instances
  MobileScannerController cameraController = MobileScannerController(
    detectionSpeed: DetectionSpeed.unrestricted,
    facing: CameraFacing.back,
  );

  //* Initial Varialble
  var isFlashTurnedOn = false.obs;

  late AnimationController animationController;
  var animationStopped = false.obs;
  @override
  void onInit() {
    animationController = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );

    animationController.forward(from: 0.0);

    animationController.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          animationController.reverse(from: 1.0);
        } else if (status == AnimationStatus.dismissed) {
          animationController.forward(from: 0.0);
        }
      },
    );

    // Future.delayed(
    //   const Duration(seconds: 7),
    //   () {
    //     animationStopped.value = true;
    //   },
    // );
    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();

    super.onClose();
  }

  //* Qr Scanner
  void onQrCamera(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    log(barcodes.first.rawValue ?? 'Kosong');
    // argument.onScannedQR(barcodes.first.rawValue ?? '');
  }
}
