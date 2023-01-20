import 'package:flutter/material.dart';
import 'package:burger/constants.dart';

class ButtonBuy extends StatefulWidget {
  const ButtonBuy({
    Key? key,
  }) : super(key: key);

  @override
  State<ButtonBuy> createState() => _ButtonBuyState();
}

class _ButtonBuyState extends State<ButtonBuy> {
  bool isLiked = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: (() {
          setState(() {
            isLiked = !isLiked;
          });
        }),
        child: Container(
            width: 130,
            height: 50,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(width: 2, color: Colors.white24),
                boxShadow: isLiked
                    ? [
                        const BoxShadow(
                            color: Colors.black,
                            blurRadius: 10,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            color: Colors.teal.shade900,
                            blurRadius: 10,
                            offset: const Offset(-4, -4))
                      ]
                    : [
                        const BoxShadow(
                            color: Colors.grey,
                            blurRadius: 10,
                            offset: Offset(4, 4)),
                        BoxShadow(
                            color: Colors.teal.shade900,
                            blurRadius: 10,
                            offset: const Offset(-4, -4))
                      ]),
            child: const Center(
              child: Text('Buy', style: style4),
            )));
  }
}
