import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chat_bubbles/bubbles/bubble_special_three.dart';
import 'package:flutter/material.dart';
import 'package:nirvana/PromptScreen/services/assets_manager.dart';

class ChatWidget extends StatelessWidget {
  const ChatWidget(
      {super.key,
      required this.msg,
      required this.chatIndex,
      this.shouldAnimate = false});

  final String msg;
  final int chatIndex;
  final bool shouldAnimate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: chatIndex == 0 ? MainAxisAlignment.end:MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              child: 
              chatIndex == 0 ? Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BubbleSpecialThree(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.of(context).size.width/1.65,
                        ),
                      text: msg,
                      color: Theme.of(context).cardColor,
                      tail: false,
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: 16
                      ),
                    ),
                      CircleAvatar( 
                        backgroundColor:const  Color.fromARGB(75, 2, 179, 255),
                        backgroundImage: AssetImage(                    
                        AssetsManager.userImage,
                        ),
                      ),
                  ],),
              )
               : 
                Container(
                padding: const EdgeInsets.all(12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundColor:const Color.fromARGB(74, 39, 188, 252) ,
                      backgroundImage: AssetImage(
                       AssetsManager.botImage,
                      ),
                    ),
                    const SizedBox(width: 10,),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Theme.of(context).canvasColor,
                      ),
                       child: SizedBox(
                        width: MediaQuery.of(context).size.width/1.65,
                         child: shouldAnimate ?
                                   DefaultTextStyle(
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 16),
                                      child: AnimatedTextKit(
                                          isRepeatingAnimation: false,
                                          repeatForever: false,
                                          displayFullTextOnTap: true,
                                          totalRepeatCount: 1,
                                          animatedTexts: [
                                            TyperAnimatedText(
                                              msg.trim(),
                                              textStyle:  const TextStyle(
                                                fontFamily: 'Cera Pro',
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              )
                                            ),
                                          ]),
                                    )
                                  : SelectableText(
                                      msg.trim(),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 16),
                                    ),
                       ),
                      ),
                    //),
                  ],
                ),
              )
            )
          ],
        ),
      ],
    );
  }
}