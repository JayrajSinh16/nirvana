import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DownloadActivityIndicator extends StatelessWidget {
  final double _progress;
  const DownloadActivityIndicator({ 
    super.key,
    required double progress,
  }) : _progress = progress;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircularProgressIndicator(
          value: _progress,
          color: Theme.of(context).primaryColor,
        ),
        SvgPicture.asset(
              'assets/images/download.svg',
              color: Theme.of(context).primaryColor,
              height: 18,
            ),
      ],
    );
  }
}
