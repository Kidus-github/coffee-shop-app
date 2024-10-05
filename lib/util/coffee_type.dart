import 'package:flutter/material.dart';

class CoffeeType extends StatelessWidget {
  final String coffeeType;
  final bool isSelected;
  final void Function()? onTap;

  const CoffeeType(
      {super.key,
      required this.coffeeType,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0),
        child: Text(
          coffeeType,
          style: TextStyle(
              color: isSelected ? Colors.orange : Colors.grey[400],
              fontSize: 18,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
