import 'package:flutter/material.dart';
import 'package:burger/constants.dart';

class Buttons extends StatefulWidget {
  final Color color;
  final Function() onPress;
  final Widget child;

  const Buttons({Key? key,
    required this.color,
    required this.onPress,
    required this.child}) : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  bool isPressed = false;
  Color color;


  void _isPressed(){
    setState(() {
      isPressed =!isPressed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(

      onTapDown: (_) {
        setState(() {
          _isPressed();
          widget.onPress.call();
        });
      },

      onTapUp: (_) {
        setState(() {
          _isPressed();
        });
      },

      onTapCancel: () {
        setState(() {
          _isPressed();
        });
      },

      child: Container(
        width: 50,
          height: 50,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: Colors.white70, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: isPressed ? [
            const BoxShadow(
            color: Colors.red,
            blurRadius: 15,
            offset: Offset(3, 3)),
            const BoxShadow(
            color: Colors.red,
            blurRadius: 15,
            offset: Offset(-3, -3)
            )
            ] : [
            const BoxShadow(
              color: KGreen,
              blurRadius: 15,
              offset: Offset(5, 5)
            ),
            const BoxShadow(
              color: Colors.yellow,
              blurRadius: 15,
              offset: Offset(-5, -5)
            )
            ]
            ),
          child: Center(child: child),
      ),


    );
  }
}
