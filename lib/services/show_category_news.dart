import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/models/show_category.dart';
import 'package:news_app/models/slider_model.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categories = []; // List to store category news articles

// Function to fetch news articles for a specific category from the API
  Future<void> getCategoriesNews(String category) async {

    // API URL for fetching top headlines for a specific category in the US
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=5e9424b8ff754c96847ae54bf00c920a";
  

  // Sending a GET request to the API URL and awaiting the response
  var response = await http.get(Uri.parse(url));

  var jsonData = jsonDecode(response.body);

// Checking if the status of the response is "ok"
  if(jsonData['status'] == "ok"){
    jsonData["articles"].forEach((element){
        if(element["urlToImage"] !=null && element["description"]!= null){

           // Creating a ShowCategoryModel instance with the article details and adding it to the list
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"]
          );
          categories.add(showCategoryModel);// Adding the article to the list of category news articles
        }
    });
  }

  
  }
}

