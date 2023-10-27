import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/theme/pallete.dart';
import 'package:speech_to_text/speech_to_text.dart';
import 'package:nirvana/VoiceAssistance/api_services.dart';
import 'package:nirvana/VoiceAssistance/chat_model.dart';
import 'package:nirvana/VoiceAssistance/tts_model.dart';

class SpeechScreen extends StatefulWidget {
  const SpeechScreen({super.key});

  @override
  State<SpeechScreen> createState() => _SpeechScreenState();
}

class _SpeechScreenState extends State<SpeechScreen> {
  SpeechToText speechtoText = SpeechToText();

  var isListening = false;
  var userText = "Aur Nirvana";
  var scrollController = ScrollController();
  String? generatedContent;

  scrollMethod() {
    scrollController.animateTo(scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  final List<ChatMessage> message = [];

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
              size: 24,
              color: Theme.of(context).primaryColor,
            )),
        title: Text(
          "Intellicom",
          style: TextStyle( 
            color: Theme.of(context).primaryColor,
            fontSize: 24,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //Virtual Assistance Picture
            Stack(
              children: [
                Center(
                  child: Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: 128,
                    //width: 128,
                    margin: const EdgeInsets.only(top: 0),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            image: AssetImage(
                                'assets/images/virtualAssistant_2.png'))),
                  ),
                )
              ],
            ),
            // User Input yaha par hai
            Align(
              alignment: Alignment.centerRight,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                margin: const EdgeInsets.symmetric(horizontal: 20)
                    .copyWith(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    22,
                  ).copyWith(topRight: Radius.zero),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    userText,
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ),
            //Nirvana Output
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              margin:
                  const EdgeInsets.symmetric(horizontal: 20).copyWith(top: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  22,
                ).copyWith(topLeft: Radius.zero),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SelectableText(
                  generatedContent == null
                      ? 'Welcome, Sir !!\nHow can I assist you ?'
                      : generatedContent!,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: generatedContent == null ? 25 : 18,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: AvatarGlow(
        endRadius: 75.0,
        animate: isListening,
        duration: const Duration(milliseconds: 2000),
        glowColor: Pallete.dark_blue2,
        repeat: true,
        repeatPauseDuration: const Duration(milliseconds: 100),
        showTwoGlows: true,
        child: GestureDetector(
          onTapDown: (details) async {
            if (!isListening) {
              var available = await speechtoText.initialize();
              if (available) {
                setState(() {
                  isListening = true;
                  speechtoText.listen(
                    onResult: (result) {
                      setState(() {
                        userText = result.recognizedWords;
                      });
                    },
                  );
                });
              }
            }
          },
          onTapUp: (details) async {
            setState(() {
              isListening = false;
            });
            await speechtoText.stop();

            if (userText.isNotEmpty) {
              message.add(ChatMessage(text: userText, type: ChatMessageType.user));
              var msg = await ApiServices.sendMessage(userText);
              msg = msg.trim();

              setState(() {
                // message.add(ChatMessage(text: msg, type: ChatMessageType.bot));
                generatedContent = msg;
              });

              Future.delayed(
                const Duration(milliseconds: 500),
                () {
                  TextToSpeech.speak(msg);
                },
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("BHAI TRY AGAIN")));
            }
          },
          child: CircleAvatar(
            backgroundColor: Theme.of(context).cardColor,
            radius: 35,
            child: Icon(
              isListening ? Icons.mic : Icons.mic_none,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ),
    );
  }
}
