import 'package:animate_do/animate_do.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/ImageGen/screens/img_screen.dart';
import 'package:nirvana/PromptScreen/screens/chat_screen.dart';
import 'package:nirvana/VoiceAssistance/chat_page.dart';
import 'package:nirvana/theme/pallete.dart';
import 'package:nirvana/suggestion_widget.dart';
import 'package:nirvana/theme/theme_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int start = 200;
  int delay = 200;


  var time = DateTime.now();
  String? timetext;
  void greetext() {
    if (time.hour.toInt() >= 6 && time.hour.toInt() <= 12) {
      setState(() {
        timetext = "Good Morning, Chief !!\nWhat task can I do for you?";
      });
    } else if (time.hour.toInt() > 12 && time.hour.toInt() <= 16) {
      setState(() {
        timetext = "Good Afternoon, Chief !!\nWhat task can I do for you?";
      });
    } else if (time.hour.toInt() > 16 && time.hour.toInt() <= 23) {
      setState(() {
        timetext = "Good Evening, Chief !!\nWhat task can I do for you?";
      });
    } else {
      setState(() {
        timetext = "Hey, Chief Night Owl !!\nWhat task can I do for you?";
      });
    }
  }

  @override
  void initState() {
    super.initState();
    greetext();
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkModeEnabled = ThemeModelInheritedNotifier.of(context).theme.brightness ==
              Brightness.dark;
  //     var brightness = MediaQuery.of(context).platformBrightness;
  // bool isDarkModeEnabled = brightness == Brightness.dark ;
    return Scaffold(
      appBar: AppBar(
        actions: [
           FadeInRight(child: const ThemeButton()),
          const SizedBox(
            width: 8,
          ),
        ],
        title: FadeInDownBig(
          child: Row(
            children: [
              Image.asset( isDarkModeEnabled ? 'assets/images/final_logo_white.png'
                : 'assets/images/final_logo_black.png',
                width: 70,
              ),
              const Text(
                "Nirvana",
                style: TextStyle(
                  fontSize: 28,
                  letterSpacing: 1,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 8,
            ),
            //Virtual Assistance Picture
            ZoomIn(
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration:  BoxDecoration(
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
                                  'assets/images/virtualAssistant_2.png',
                                  ),
                              ),
                            ),
                    ),
                  )
                ],
              ),
            ),

            //Welcome Line Hai
            FadeInRight(
              duration: const Duration(milliseconds: 2000),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                margin: const EdgeInsets.symmetric(horizontal: 30)
                    .copyWith(top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(
                    22,
                  ).copyWith(topLeft: Radius.zero),
                  border: Border.all(
                    color: Pallete.borderColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    timetext.toString(),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 18,
                      //fontFamily: "Cera Pro",
                    ),
                  ),
                ),
              ),
            ),
            SlideInLeft(
              child: Container(
                padding: const EdgeInsets.all(10),
                margin: const EdgeInsets.only(
                  top: 10,
                  left: 22,
                ),
                alignment: Alignment.topLeft,
                child: Text(
                  'Countless features',
                  style: TextStyle(
                      //fontFamily: 'Cera Pro',
                      color: Theme.of(context).primaryColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),

            //Suggestion List
            Column(
              children: [
                SlideInLeft(
                  delay: Duration(milliseconds: start * 2),
                  child: FeatureBox(
                    imgpath: 'assets/images/chat.svg',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ChatScreen(),
                          ));
                    },
                    color: isDarkModeEnabled ? Pallete.dark_blue2 : Pallete.lightblue2,
                    headerText: 'WordWizz',
                    description:
                        'A smarter way to get organized and informed way to generate Text and Code Completion',
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + delay * 2),
                  child: FeatureBox(
                    imgpath: 'assets/images/image.svg',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ImageScreen(),
                          ));
                    },
                    color: isDarkModeEnabled ? Pallete.darkblue3 : Pallete.secondSuggestionBoxColor,
                    headerText: 'Pixelator',
                    description:
                        'Get inspired and stay creative with your personal assistant to generate Marvelous visuals',
                  ),
                ),
                SlideInLeft(
                  delay: Duration(milliseconds: start + 4 * delay),
                  child: FeatureBox(
                    imgpath: 'assets/images/voice.svg',
                    function: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SpeechScreen(),
                          ));
                    },
                    color:isDarkModeEnabled ? Pallete.darkblue4 : Pallete.light_blue2,
                    headerText: 'Intellicom',
                    description:
                        'Get the best of the results on ease of your voice',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

