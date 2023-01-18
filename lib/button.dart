// import 'package:burger/constants.dart';
// import 'package:flutter/material.dart';
//
// class Button extends StatelessWidget {
//   Button({Key? key,
//     required this.color,
//     required this.onPress,
//     required this.child,}) : super(key: key);
//
//   final Color color;
//   final Function() onPress;
//   final Widget child;
//
//   bool isPressed = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onPress,
//         child: Container(
//           width: 50,
//           height: 50,
//           margin: const EdgeInsets.all(15),
//           decoration: BoxDecoration(
//             color: color,
//             border: Border.all(color: Colors.white70, width: 2),
//             borderRadius: BorderRadius.circular(10),
//             boxShadow: isPressed ? [
//             const BoxShadow(
//             color: Colors.red,
//             blurRadius: 15,
//             offset: Offset(3, 3)),
//             const BoxShadow(
//             color: Colors.red,
//             blurRadius: 15,
//             offset: Offset(-3, -3)
//             )
//             ] : [
//             const BoxShadow(
//               color: KGreen,
//               blurRadius: 15,
//               offset: Offset(5, 5)
//             ),
//             const BoxShadow(
//               color: Colors.yellow,
//               blurRadius: 15,
//               offset: Offset(-5, -5)
//             )
//             ]
//             ),
//           child: Center(child: child),
//         ),
//     );
//
//   }
// }

