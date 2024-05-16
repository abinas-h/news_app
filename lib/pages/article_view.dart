import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// Stateful widget to display the article view
class ArticleView extends StatefulWidget {
  String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Custom app bar with the Daily News title
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Daily",
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            Text(
              "News",
              style: TextStyle(
                  fontSize: 23,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        // Container to hold the WebView widget
        child: WebView(
          // Display the web content of the article
          initialUrl: widget.blogUrl,
          // Enable JavaScript for unrestricted functionality
          javascriptMode: JavascriptMode.unrestricted,
        ),
      ),
    );
  }
}
