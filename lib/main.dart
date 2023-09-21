import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:riset_flutter/global_components/custom_button_widget.dart';
import 'package:riset_flutter/qr_code/view/qr_code_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      useInheritedMediaQuery: true,
      child: GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text('Riset Development'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButtonWidget.outlined(
                  text: 'QR Scanner',
                  splashColor: Colors.green.shade400,
                  onTap: () => Get.to(const QrCodeScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
