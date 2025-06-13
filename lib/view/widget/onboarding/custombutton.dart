import 'package:flutter/material.dart';

class Custombutton extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  final VoidCallback onPressed;
  final EdgeInsetsGeometry padding;
  final bool isTextButton;
  final double? width;

  const Custombutton({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.textColor,
    required this.onPressed,
    this.padding = const EdgeInsets.symmetric(
        horizontal: 24, vertical: 16), 
    this.isTextButton = false,
    this.width

  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: isTextButton ? null : 52,
      width: isTextButton ? null : width,
      decoration: isTextButton
          ? null
          : BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
      child: isTextButton
          ? TextButton(
              onPressed: onPressed,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 14,
                  color: textColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            )
          : ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: padding,
                backgroundColor: backgroundColor,
                foregroundColor: textColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                elevation: 4,
                minimumSize:
                    Size( width ?? double.infinity, 52,),
              ),
              onPressed: onPressed,
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
    );
  }
}
