import 'dart:convert';

import 'package:news_app/models/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

// Function to fetch news articles from the API
  Future<void> getNews() async {

    // API URL for fetching news articles related to Tesla
    String url =
        "https://newsapi.org/v2/everything?q=tesla&from=2024-04-16&sortBy=publishedAt&apiKey=5e9424b8ff754c96847ae54bf00c920a";
  

  // Sending a GET request to the API URL and awaiting the response
  var response = await http.get(Uri.parse(url));

// Decoding the JSON response body
  var jsonData = jsonDecode(response.body);


 // Checking if the status of the response is "ok"
  if(jsonData['status'] == "ok"){


    // Iterating over each article in the "articles" section of the JSON data
    jsonData["articles"].forEach((element){

      // Checking if the article has both an image URL and a description
        if(element["urlToImage"] !=null && element["description"]!= null){

           // Creating an ArticleModel instance with the article details and adding it to the list
          ArticleModel articleModel = ArticleModel(
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"],
            author: element["author"]
          );
          news.add(articleModel);// Adding the article to the list of news articles
         
        }
    });
  }

  
  }
}
