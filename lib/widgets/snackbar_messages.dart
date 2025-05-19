import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackBarMessages {
  static snackBars(String type, String message, {bool showProgress = true}) {
    final Color snackBarColor = type == "error"
        ? Colors.red
        : type == "info"
            ? Colors.orange
            : Colors.green;

    final IconData icon = type == "error"
        ? Icons.error_outline
        : type == "info"
            ? Icons.info_outline
            : Icons.check_circle_outline;

    final String title = type == "error"
        ? "Error"
        : type == "info"
            ? "Info"
            : "Success";

    Get.snackbar(
      title,
      '',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: snackBarColor,
      colorText: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      margin: const EdgeInsets.only(bottom: 40, left: 10, right: 10),
      icon: type == "success"
          ? Icon(
              Icons.check_circle_outline_outlined,
              color: Colors.white,
            )
          : SpinningIcon(icon: icon),
      shouldIconPulse: true,
      animationDuration: const Duration(milliseconds: 400),
      duration: const Duration(seconds: 4),
      isDismissible: true,
      messageText: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          if (showProgress)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: TweenAnimationBuilder<double>(
                tween: Tween(begin: 0.0, end: 1.0),
                duration: const Duration(seconds: 4),
                builder: (context, value, child) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Container(
                      height: 2,
                      width: MediaQuery.of(context).size.width * value,
                      color: Colors.white,
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class SpinningIcon extends StatefulWidget {
  final IconData icon;
  const SpinningIcon({required this.icon, super.key});

  @override
  State<SpinningIcon> createState() => _SpinningIconState();
}

class _SpinningIconState extends State<SpinningIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: Icon(widget.icon, color: Colors.white),
    );
  }
}
