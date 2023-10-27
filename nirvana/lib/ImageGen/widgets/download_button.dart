import 'package:flutter/material.dart';
import 'package:nirvana/ImageGen/widgets/image_download_button.dart';

class GenerateButton extends StatelessWidget {
  

  const GenerateButton({super.key,required this.imageUrl,required this.isGenerating});
  final String? imageUrl;
  final bool isGenerating;
  @override
  Widget build(BuildContext context) {
  
    return Container(
      width: 200,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
      ),
      child: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ImageDownloadButton(
            imageUrl: imageUrl,
            isGenerating: isGenerating,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            "Download",
            style:
                TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
          ),
        ],
      )),
    );
  }
}
