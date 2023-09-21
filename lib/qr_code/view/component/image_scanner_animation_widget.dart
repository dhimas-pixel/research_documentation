import 'package:flutter/material.dart';

class ImageScannerAnimationWidget extends AnimatedWidget {
  final bool stopped;
  final double width;
  final Color colorOne;
  final Color colorTwo;

  ImageScannerAnimationWidget(this.stopped, this.width,
      {Key? key, Animation<double>? animation})
      : colorOne = Colors.blue,
        colorTwo = Colors.blue.withOpacity(0.16),
        super(key: key, listenable: animation!);

  ImageScannerAnimationWidget.qoin(this.stopped, this.width,
      {Key? key, Animation<double>? animation})
      : colorOne = const Color(0xfff48e2d),
        colorTwo = const Color(0x00fac15a),
        super(key: key, listenable: animation!);

  @override
  Widget build(BuildContext context) {
    final Animation<double> animation = listenable as Animation<double>;
    final scorePosition =
        (animation.value * MediaQuery.of(context).size.height) - 100;

    Color color1 = colorOne;
    Color color2 = colorTwo;

    if (animation.status == AnimationStatus.reverse) {
      color1 = colorTwo;
      color2 = colorOne;
    }

    return Positioned(
      bottom: scorePosition,
      child: Opacity(
        opacity: (stopped) ? 0.0 : 1.0,
        child: Container(
          height: 80.0,
          width: width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            stops: const [0.01, 0.9],
            colors: [color1, color2],
          )),
        ),
      ),
    );
  }
}
