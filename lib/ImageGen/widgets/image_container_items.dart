import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({
    super.key, required this.error,
  });

  final String? error;

  @override
  Widget build(BuildContext context) {
    return Center(child: Padding(
      padding: const EdgeInsets.all(16),
      child: Text('Error: $error'),
    ));
  }
}

class LodingAnimation extends StatelessWidget {
  const LodingAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
          height: 256,
          child: Lottie.asset(
              'assets/animations/loading.json',),
          ),
    );
  }
}

