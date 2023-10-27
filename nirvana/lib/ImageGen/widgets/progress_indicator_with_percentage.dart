import 'package:flutter/material.dart';
import 'package:nirvana/ImageGen/widgets/image_container_items.dart';

class ProgressIndicatorWithPercentage extends StatelessWidget {
  final double progress;
  const ProgressIndicatorWithPercentage({super.key, required this.progress});

  @override
  Widget build(BuildContext context) {
    return  Stack(
      alignment: Alignment.center,
      children: [
        // Positioned(
        //   bottom: 0,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       border: Border(
        //         top: BorderSide(
        //           color:Theme.of(context).primaryColor,
        //         ),
        //       ),
        //     ),
        //     width: MediaQuery.of(context).size.width - 16,
        //     child: LinearProgressIndicator(
        //       minHeight: 30,
        //       color: Theme.of(context).primaryColor,
        //       value: progress,
        //     ),
        //   ),
        // ),
        const LodingAnimation(),
        Text(
          '${(progress * 100).toStringAsFixed(0)}%',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
