import 'package:flutter/material.dart';
import 'package:nirvana/ImageGen/services/ai_handler.dart';
import 'package:nirvana/ImageGen/widgets/album_button.dart';
import 'package:nirvana/ImageGen/widgets/description_field.dart';
import 'package:nirvana/ImageGen/widgets/download_button.dart';
import 'package:nirvana/ImageGen/widgets/image_container.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({super.key});

  @override
  State<ImageScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ImageScreen> {
  final aiHandler = AIHandler();
  String? _imageUrl;
  bool _isGenerating = false;
  String _displayMessage =
      'Think outside the box and amaze\n the world with your creativity';

  @override
  void dispose() {
    // aiHandler.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Theme.of(context).primaryColor,
            size: 24,
          ),
        ),
        title: Text(
          'Pixelator',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        actions: const [
          AlbumButton(),
          SizedBox(
            width: 15,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 20),
              DescriptionField(
                isGenerating: _isGenerating,
                onSubmitted: generateImage,
              ),
              const SizedBox(height: 32),
              ImageContainer(
                isGenerating: _isGenerating,
                imageUrl: _imageUrl,
                displayMessage: _displayMessage,
              ),
              const SizedBox(height: 32),
              GenerateButton(
                imageUrl: _imageUrl,
                isGenerating: _isGenerating,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void generateImage(String prompt) async {
    setState(() => _isGenerating = true);
    final result = await aiHandler.generateImage(prompt);
    setState(() {
      _isGenerating = false;
      _imageUrl = result ?? _imageUrl;
      _displayMessage = result == null
          ? 'An error occurred. Please try again.'
          : _displayMessage;
    });
  }
}
