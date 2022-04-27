import 'package:flutter/material.dart';
import 'package:seeclouds/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final IconData? icon;
  const CustomFloatingButton({Key? key, this.icon, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [kPrimaryBlueColor, kPrimaryPinkColor],
          ),
          borderRadius: BorderRadius.circular(40)),
      child: RawMaterialButton(
        onPressed: onPressed,
        shape: const CircleBorder(),
        constraints: const BoxConstraints(
          minHeight: 56,
          minWidth: 56,
        ),
        child: Icon(
          icon,
          color: kPrimaryWhite,
        ),
      ),
    );
  }
}
