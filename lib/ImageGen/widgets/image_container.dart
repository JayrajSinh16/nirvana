import 'package:flutter/material.dart';
import 'package:nirvana/ImageGen/widgets/cached_network_image.dart';

class ImageContainer extends StatefulWidget {
  final bool _isGenerating;
  final String? _imageUrl;
  final String _displayMessage;
  const ImageContainer({
    super.key,
    required bool isGenerating,
    required String? imageUrl,
    required String displayMessage,
  })  : _isGenerating = isGenerating,
        _imageUrl = imageUrl,
        _displayMessage = displayMessage;

  @override
  State<ImageContainer> createState() => _ImageContainerState();
}

class _ImageContainerState extends State<ImageContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      height: MediaQuery.of(context).size.width,
      width: double.infinity,
      child: widget._isGenerating
          ? Center(
              child: Text(
                'Image is being generated...',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            )
          : widget._imageUrl == null
              ? Center(
                  child: Text(
                    widget._displayMessage,
                    style: TextStyle(
                      fontSize: 16,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                )
              : MyCachedNetworkImage(imageUrl: widget._imageUrl),
    );
  }
}
