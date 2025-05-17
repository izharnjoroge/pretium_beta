import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final bool isLoading;
  final Color? color;

  const CustomButton({
    super.key,
    required this.text,
    this.onPressed,
    this.isLoading = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: color ?? Theme.of(context).primaryColor,
      ),
      child: Center(
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
                strokeWidth: 3.0,
              )
            : Text(text,
                style: const TextStyle(fontSize: 18.0, color: Colors.white)),
      ),
    );
  }
}
