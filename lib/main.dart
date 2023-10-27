import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animated_theme_switcher/animated_theme_switcher.dart';
import 'package:nirvana/PromptScreen/providers/chat_provider.dart';
import 'package:nirvana/PromptScreen/providers/models_providers.dart';
import 'package:nirvana/VoiceAssistance/tts_model.dart';
import 'package:nirvana/home_page.dart';
import 'package:nirvana/theme/theme_service.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final themeService = await ThemeService.instance;
  var initTheme = themeService.initial;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  TextToSpeech.initTTS();
  runApp(MyApp(
    theme: initTheme,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.theme});

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ModelsProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider()),
      ],
      builder: (context, _) {
        return ThemeProvider(
            initTheme: theme,
            builder: (_, theme) {
              return MaterialApp(
                title: 'Nirvana',
                debugShowCheckedModeBanner: false,
                theme: theme,
                home: const HomePage(),
              );
            });
      },
    );
  }
}
