import 'package:flutter/material.dart';

class CircularIndecator extends StatelessWidget {
  final bool isActive;
  const CircularIndecator({Key? key, required this.isActive}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        height: isActive ? 12 : 8,
        width: isActive ? 12 : 8,
        decoration: BoxDecoration(
            color: isActive ? Colors.teal : Colors.grey,
            borderRadius: const BorderRadius.all(Radius.circular(12))),
      ),
    );
  }
}
