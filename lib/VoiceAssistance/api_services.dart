import 'dart:convert';

import 'package:http/http.dart' as http;

String apiKey = '<ENTER YOUR API KEY HERE>';

class ApiServices {
 static String baseUrl = "https://api.openai.com/v1/chat/completions";

  static Map<String, String> header = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $apiKey',
  };

 static sendMessage(String? message) async {
    var res = await http.post(Uri.parse(baseUrl),
        headers: header,
        body: jsonEncode({
          "model": "gpt-3.5-turbo",
          "messages": [
            {"role": "user", "content": "$message"}
          ],
        }));

      if(res.statusCode == 200){
        var data = jsonDecode(res.body.toString());
        var  msg = data["choices"][0]["message"]["content"];
        return msg;
      }
      else{
        print("FAILED TO FETCH DATA !!");
      }
  }
}
