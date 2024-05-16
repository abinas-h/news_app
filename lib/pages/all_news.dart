import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/slider_model.dart';
import 'package:news_app/pages/article_view.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/services/slider_data.dart';

// StatefulWidget to display all news articles
class AllNews extends StatefulWidget {
  // The type of news (e.g., "Breaking" or "Trending")
  String news;
  AllNews({required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<SliderModel> sliders = [];// Lists to hold slider and article data
  List<ArticleModel> articles = [];// Boolean to show loading status
  bool loading = true;

  void initState() {
    // Fetch slider and article data when the widget is initialized
    getSlider();
    super.initState();
    getNews();
  }

// Function to fetch all news articles
  getNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;

// Update the UI to reflect changes
    setState(() {});
  }


 // Function to fetch slider dat
  getSlider() async {
    Sliders slider = new Sliders();
    await slider.getSlider();
    sliders = slider.sliders;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.news + " News",
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),

         // List view to display all news articles
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount:
                widget.news == "Breaking" ? sliders.length : articles.length,
            itemBuilder: (context, index) {
              return AllNewsSection(
                image: widget.news == "Breaking"
                    ? sliders[index].urlToImage!
                    : articles[index].urlToImage!,
                desc: widget.news == "Breaking"
                    ? sliders[index].description!
                    : articles[index].description!,
                title: widget.news == "Breaking"
                    ? sliders[index].title!
                    : articles[index].title!,
                url: widget.news == "Breaking"
                    ? sliders[index].url!
                    : articles[index].url!,
              );
            }),
      ),
    );
  }
}


// StatelessWidget to display individual news articles
class AllNewsSection extends StatelessWidget {

   // Fields to hold article details
  String image, desc, title, url;
  AllNewsSection(
      {required this.image,
      required this.desc,
      required this.title,
      required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // Navigate to the ArticleView page when the article is tapped
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
          child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: image,
              width: MediaQuery.of(context).size.width,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            height: 5.0,
          ),
           // Display article title
          Text(
            title,
            maxLines: 2,
            style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold),
          ),
          Text(
            desc,
            maxLines: 3,
          ),
          SizedBox(
            height: 20.0,
          ),
        ],
      )),
    );
  }
}
