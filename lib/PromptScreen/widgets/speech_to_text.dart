import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_recognition_result.dart';
import 'package:speech_to_text/speech_to_text.dart';

class SpeechToTextPage extends StatefulWidget {
  final TextEditingController textController;
 const SpeechToTextPage({Key ? key, required this.textController}) : super(key: key);
 
 
  @override
  _SpeechToTextPage createState() => _SpeechToTextPage();
}

class _SpeechToTextPage extends State<SpeechToTextPage> {

  final SpeechToText _speechToText = SpeechToText();
  bool _speechEnabled = false;
  String _lastWords = "";

 
  @override
  void initState() {
    super.initState();
    if (!_speechEnabled) {
      _initSpeech();
    }
  }

  /// This has to happen only once per app
  void _initSpeech() async {
    _speechEnabled = await _speechToText.initialize();
  }

  /// Each time to start a speech recognition session
  void _startListening() async {
    await _speechToText.listen(
      // onResult: _onSpeechResult,
      // listenFor: const Duration(seconds: 30),
      // localeId: "en_En",
      // cancelOnError: false,
      // partialResults: false,
      // listenMode: ListenMode.confirmation,
    );
    setState(() {});
  }

  /// Manually stop the active speech recognition session
  /// Note that there are also timeouts that each platform enforces
  /// and the SpeechToText plugin supports setting timeouts on the
  /// listen method.
  void _stopListening() async {
    await _speechToText.stop();
    setState(() {});
  }

  /// This is the callback that the SpeechToText plugin calls when
  /// the platform returns recognized words.
  void _onSpeechResult(SpeechRecognitionResult result) {
    setState(() {
      _lastWords = "$_lastWords${result.recognizedWords} ";
      widget.textController.text = _lastWords;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Expanded(
              //   child: TextField(
              //     controller: widget.textController,
              //     minLines: 6,
              //     maxLines: 10,
              //     decoration: InputDecoration(
              //       filled: true,
              //       fillColor: Colors.grey.shade300,
              //     ),
              //   ),
              // ),
              // const SizedBox(
              //   width: 8,
              // ),
              IconButton(
                onPressed:
                    // If not yet listening for speech start, otherwise stop
                    _speechToText.isNotListening
                        ? _startListening
                        : _stopListening,
                icon: Icon(_speechToText
                        .isNotListening
                    ? Icons.mic_off
                    : Icons.mic),
              )
            ],
          );
      
  }
}