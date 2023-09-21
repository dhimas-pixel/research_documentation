import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:riset_flutter/qr_code/controller/qr_code_controller.dart';
import 'package:riset_flutter/qr_code/view/component/image_scanner_animation_widget.dart';
import 'package:riset_flutter/qr_code/view/qr_image_screen.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(QrCodeController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan QR'),
        elevation: 0.5,
        actions: [
          Obx(
            () => IconButton(
              splashRadius: 15,
              icon: (controller.isFlashTurnedOn.value == true)
                  ? const Icon(
                      Icons.flash_on_rounded,
                      size: 24,
                      color: Colors.black,
                    )
                  : const Icon(
                      Icons.flash_off_rounded,
                      size: 24,
                      color: Colors.black,
                    ),
              onPressed: () {
                if (controller.isFlashTurnedOn.value == true) {
                  controller.isFlashTurnedOn.value = false;
                  controller.cameraController.toggleTorch();
                } else {
                  controller.isFlashTurnedOn.value = true;
                  controller.cameraController.toggleTorch();
                }
              },
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // * Mobile Scanner package digunakan sebagai scanning QR yang mengembalikan isi QR melalui function onDetect
          Align(
            alignment: Alignment.center,
            child: MobileScanner(
              controller: controller.cameraController,
              fit: BoxFit.fitHeight,
              onDetect: (capture) {
                controller.onQrCamera(capture);
              },
            ),
          ),
          Obx(
            () => ImageScannerAnimationWidget(
              controller.animationStopped.value,
              MediaQuery.of(context).size.width,
              animation: controller.animationController,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.symmetric(
                vertical: 16.h,
              ),
              width: double.infinity,
              color: Colors.white,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: double.infinity,
                    height: 48.h,
                    margin: const EdgeInsets.all(16),
                    child: OutlinedButton.icon(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                          width: 1,
                          color: Colors.blue,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                      ),
                      onPressed: () => Get.to(const QrImageScreen()),
                      icon: Icon(
                        Icons.qr_code,
                        size: 24.0.h,
                      ),
                      label: Text(
                        'Buka QR Code',
                        style: TextStyle(
                          fontFamily: 'openSans',
                          fontSize: 16.sp,
                          letterSpacing: 0.2.sp,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 35.w),
                    child: Text(
                      'Arahkan kamera kamu ke kode QR untuk melakukan Scanning',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: 'openSans',
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
