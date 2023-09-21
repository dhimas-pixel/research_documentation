import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

class QrCodeController extends GetxController
    with GetSingleTickerProviderStateMixin {
  static QrCodeController get to => Get.find();

  //* Controllers Setting Mobile Scanner
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
    // * Setting animation controller
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

    super.onInit();
  }

  @override
  void onClose() {
    animationController.dispose();

    super.onClose();
  }

  //* Qr Scanner digunakan untuk mengambil isi data dari QR
  void onQrCamera(BarcodeCapture capture) {
    final List<Barcode> barcodes = capture.barcodes;
    if (barcodes.isEmpty) return;

    // * isi data dikembalikan menggunakan log
    log(barcodes.first.rawValue ?? 'Kosong');
  }
}
