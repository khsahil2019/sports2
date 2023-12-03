import 'package:flutter/material.dart';

Widget CustomIconTextWidget(
    IconData icon, Color iconColor, double iconSize, String addressText) {
  return Row(
    children: [
      Icon(
        icon,
        size: iconSize,
        color: iconColor,
      ),
      const SizedBox(width: 10), // Adjust the space between the icon and text
      Expanded(
        child: Text(
          addressText,
          style: const TextStyle(fontSize: 16),
          overflow:
              TextOverflow.ellipsis, // Handles overflow if text is too long
        ),
      ),
    ],
  );
}
