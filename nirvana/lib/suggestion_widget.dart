//import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FeatureBox extends StatelessWidget {
  final Color color;
  final String headerText;
  final String description;
  final Function() function;
  final String imgpath;
  const FeatureBox(
      {super.key,
      required this.function,
      required this.color,
      required this.headerText,
      required this.description,
      required this.imgpath});

  @override
  Widget build(BuildContext context) {
    // bool isDarkModeEnabled = ThemeModelInheritedNotifier.of(context).theme.brightness == Brightness.dark;
    return InkWell(
      onTap: function,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 35,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 18).copyWith(
            left: 15,
          ),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Row(
                  children: [
                    SvgPicture.asset(
                      imgpath,
                      color: Theme.of(context).primaryColor,
                      height: 28,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      headerText,
                      style: TextStyle(
                        fontFamily: 'Cera Pro',
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Text(
                  description,
                  style: TextStyle(
                    fontFamily: 'Cera Pro',
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
