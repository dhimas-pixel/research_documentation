import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrImageScreen extends StatelessWidget {
  const QrImageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffFDB623),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            QrImageView(
              data: 'Aku Sayang Kamu',
              size: 200,
              eyeStyle: const QrEyeStyle(
                eyeShape: QrEyeShape.square,
                color: Colors.white,
              ),
              dataModuleStyle: const QrDataModuleStyle(
                dataModuleShape: QrDataModuleShape.square,
                color: Colors.white,
              ),
            ),
            SizedBox(
              height: 22.h,
            ),
            Text(
              "Go and enjoy our features for free and make your life easy with us.",
              style: TextStyle(
                fontSize: 17.sp,
                fontFamily: 'itim',
                fontWeight: FontWeight.w400,
                letterSpacing: 0.02.sp,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
