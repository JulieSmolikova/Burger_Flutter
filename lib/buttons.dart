import 'package:flutter/material.dart';
import 'package:burger/constants.dart';

class Buttons extends StatefulWidget {
  final Color color;
  final Function() onPress;
  final Widget child;

  const Buttons(
      {Key? key,
      required this.color,
      required this.onPress,
      required this.child})
      : super(key: key);

  @override
  State<Buttons> createState() => _ButtonsState();
}

class _ButtonsState extends State<Buttons> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onPress,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
            color: widget.color,
            border: Border.all(color: Colors.white24, width: 2),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black, blurRadius: 10, offset: Offset(4, 4)),
              BoxShadow(color: Colors.teal.shade900, blurRadius: 10, offset: Offset(-4, -4))
            ]),
        child: Center(child: widget.child),
      ),
    );
  }
}
