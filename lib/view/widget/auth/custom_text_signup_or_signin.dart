import 'package:flutter/material.dart';

class CustomTextSignupOrSignin extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomTextSignupOrSignin({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          text,
          style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
              decoration: TextDecoration.underline,
              decorationColor: Colors.indigo),
        ),
      ),
    );
  }
}
