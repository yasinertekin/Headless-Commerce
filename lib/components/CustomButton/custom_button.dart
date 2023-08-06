import 'package:flutter/material.dart ';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color backgroundColor;
  final String buttonText;
  final Color textColor;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.buttonText,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        minimumSize: const Size(300, 50),
      ),
      child: Text(buttonText, style: Theme.of(context).textTheme.labelLarge?.copyWith(color: textColor)),
    );
  }
}
