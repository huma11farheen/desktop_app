import 'package:flutter/material.dart';
class Button extends StatelessWidget {

  final Color? buttonColor;
  final Color? textColor;
  final String? buttonText;
  final VoidCallback buttontapped;

  const Button({
    Key? key,
    this.buttonColor,
    this.textColor,
    required this.buttonText,
    required this.buttontapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontapped,
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: ClipRRect(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(56),
              color: buttonColor ?? Colors.grey,
            ),
            child: Center(
              child: Text(
                buttonText ?? '',
                style: TextStyle(
                  color: textColor ?? Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
