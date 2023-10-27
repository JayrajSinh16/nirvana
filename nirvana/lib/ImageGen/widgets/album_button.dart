import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../screens/art_screen.dart';

class AlbumButton extends StatelessWidget {
  const AlbumButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const ArtScreen()),
        );
      },
      icon: SvgPicture.asset(
        'assets/images/album.svg',
        color: Theme.of(context).primaryColor,
        height: 28,
      ),
    );
  }
}
