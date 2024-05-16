import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/slider_model.dart';

class Sliders {
  List<SliderModel> sliders = [];

  Future<void> getSlider() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=5e9424b8ff754c96847ae54bf00c920a";

    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

// Checking if the status of the response is "ok"
    if (jsonData['status'] == "ok") {
      // Iterating over each article in the "articles" section of the JSON data
      jsonData["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          // Creating a SliderModel instance with the article details and adding it to the list
          SliderModel sliderModel = SliderModel(
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"],
              author: element["author"]);
          sliders.add(sliderModel); // Adding the slider item to the list
        }
      });
    }
  }
}
