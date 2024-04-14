import 'package:flutter/material.dart';

class ButtonSidebarOption extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final IconData icon;

  const ButtonSidebarOption(
      {super.key, required this.onTap, required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onTap,
      icon: Icon(
        icon,
        color: Colors.black,
        size: 30,
      ),
      label: Text(
        text,
        style: const TextStyle(
          fontSize: 18,
          color: Colors.black,
        ),
      ),
    );
  }
}
