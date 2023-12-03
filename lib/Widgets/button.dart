import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? buttonColor;
  final Color? borderColor;
  final Color? textColor;
  final FontWeight? font;
  final double borderRadius;
  final double buttonHeight;
  final double buttonWidth;

  const CustomButton({
    Key? key,
    required this.text,
    this.onPressed,
    this.font,
    this.buttonColor,
    this.borderColor,
    this.textColor,
    this.borderRadius = 10,
    this.buttonHeight = 50,
    this.buttonWidth = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: buttonWidth,
        height: buttonHeight,
        decoration: BoxDecoration(
          border: Border.all(color: borderColor ?? Colors.blue),
          borderRadius: BorderRadius.circular(borderRadius),
          color: buttonColor ??
              Theme.of(context)
                  .primaryColor, // Defaults to primary color if not specified
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: textColor ??
                  Colors.white, // Defaults to white if not specified
              fontSize: 16,
              fontWeight: font,
            ),
          ),
        ),
      ),
    );
  }
}
