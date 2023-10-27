import 'package:flutter_tts/flutter_tts.dart';

class TextToSpeech {
  static FlutterTts tts = FlutterTts();
  static initTTS() async {
    print(await tts.getLanguages);
    //for english
    //tts.setLanguage("en-US");
    //for hindi
    tts.setLanguage("hi-IN");
    //for gujarati
    //tts.setLanguage("gu-IN");
  }

  static speak(String text) async {
    tts.setStartHandler(() {
      print('TTS START HO GAYA');
    });

    tts.setCompletionHandler(() {
      print("TTS COMPLETE HO GAYA");
    });

    tts.setErrorHandler((message) {
      print(message);
    });

    await tts.awaitSpeakCompletion(true);

    tts.speak(text);
  }
}
