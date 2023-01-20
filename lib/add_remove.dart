import 'package:flutter/material.dart';
import 'package:burger/constants.dart';

class QuantityButtons extends StatefulWidget {
  const QuantityButtons({Key? key}) : super(key: key);

  @override
  State<QuantityButtons> createState() => _QuantityButtonsState();
}

class _QuantityButtonsState extends State<QuantityButtons> {
  int _quantity = 1;

  void add() {
    setState(() {
      _quantity++;
    });
  }

  void remove() {
    setState(() {
      _quantity--;
      if (_quantity <= 1) {
        _quantity = 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          top: 5,
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    blurRadius: 20,
                    spreadRadius: 1)
              ]),
              child: Text(
                '$_quantity',
                style: style4),
            ),
          ),
        ),

        Container(
          padding: const EdgeInsets.fromLTRB(6, 6, 0, 0),
          width: 165,
          height: 75,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: CustomPaint(
            painter: Shadow(),
          ),
        ),

        Container(
          padding: const EdgeInsets.all(4),
          width: 165,
          height: 75,
          decoration: const BoxDecoration(color: Colors.transparent),
          child: CustomPaint(
            painter: AddRemove(),
          ),
        ),

        Positioned(
          left: 0,
            top: 20,
            child: IconButton(
              onPressed: remove,
              icon: const Icon(
                Icons.remove,
                color: Colors.white,
                size: 40,
          ),
              splashRadius: 1)),

        Positioned(
            right: 10,
            top: 20,
            child: IconButton(
                onPressed: add,
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 40,
                ),
                splashRadius: 1)),
      ],
    );
  }
}

class AddRemove extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var pathFrame = Path();
    var paintFrame = Paint()
      ..color = const Color(0xff5a6e70).withOpacity(0.8)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 6.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 2.5);

    pathFrame.moveTo(0, size.height * 0.7);
    pathFrame.quadraticBezierTo(0, size.height * 0.45, size.width * 0.1, size.height * 0.4);
    pathFrame.cubicTo(size.width * 0.3, size.height * 0.4, size.width * 0.3, size.height * 0.8, size.width * 0.5, size.height * 0.8);
    pathFrame.cubicTo(size.width * 0.7, size.height * 0.8, size.width * 0.7, size.height * 0.4, size.width * 0.9, size.height * 0.4);
    pathFrame.quadraticBezierTo(size.width, size.height * 0.45, size.width, size.height * 0.7);
    pathFrame.quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height);
    pathFrame.lineTo(size.width * 0.2, size.height);
    pathFrame.quadraticBezierTo(0, size.height, 0, size.height * 0.7);

    canvas.drawPath(pathFrame, paintFrame);

    var path = Path();
    var paint = Paint()
      ..color = const Color(0xff142329)
      ..style = PaintingStyle.fill
      ..strokeWidth = 3.0
      ..isAntiAlias = true;

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(0, size.height * 0.45, size.width * 0.1, size.height * 0.4);
    path.cubicTo(size.width * 0.3, size.height * 0.4, size.width * 0.3, size.height * 0.8, size.width * 0.5, size.height * 0.8);
    path.cubicTo(size.width * 0.7, size.height * 0.8, size.width * 0.7, size.height * 0.4, size.width * 0.9, size.height * 0.4);
    path.quadraticBezierTo(size.width, size.height * 0.45, size.width, size.height * 0.7);
    path.quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(0, size.height, 0, size.height * 0.7);

    canvas.drawPath(path, paint);
  }
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class Shadow extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var pathShadow = Path();
    var paintShadow = Paint()
      ..color = Colors.black
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12.0
      ..isAntiAlias = true
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 5.0);

    pathShadow.moveTo(0, size.height * 0.7);
    pathShadow.quadraticBezierTo(0, size.height * 0.45, size.width * 0.1, size.height * 0.4);
    pathShadow.cubicTo(size.width * 0.3, size.height * 0.4, size.width * 0.3, size.height * 0.8, size.width * 0.5, size.height * 0.8);
    pathShadow.cubicTo(size.width * 0.7, size.height * 0.8, size.width * 0.7, size.height * 0.4, size.width * 0.9, size.height * 0.4);
    pathShadow.quadraticBezierTo(size.width, size.height * 0.45, size.width, size.height * 0.7);
    pathShadow.quadraticBezierTo(size.width, size.height, size.width * 0.8, size.height);
    pathShadow.lineTo(size.width * 0.2, size.height);
    pathShadow.quadraticBezierTo(0, size.height, 0, size.height * 0.7);

    canvas.drawPath(pathShadow, paintShadow);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}