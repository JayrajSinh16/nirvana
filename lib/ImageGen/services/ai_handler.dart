import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class AIHandler {
  final openAI = OpenAI.instance.build(
    token: '<ENTER YOUR API KEY HERE>',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 20)),
  );

  Future<ImageUrl?> generateImage(String prompt) async {
    try {
      final request = GenerateImage(
        prompt,
        1,
      );
      final response = await openAI.generateImage(request);
      final imageDataList = response?.data;
      final imageData = imageDataList?.last;
      return imageData?.url;
    } catch (e) {
      print(e);
    }
    return null;
  }
}

typedef ImageUrl = String;
