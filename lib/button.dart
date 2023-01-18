import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button({Key? key,
    required this.color,
    required this.onPress,
    required this.child}) : super(key: key);

  final Color color;
  final Function() onPress;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: Colors.white70, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(child: child),
      ),
    );
  }
}
