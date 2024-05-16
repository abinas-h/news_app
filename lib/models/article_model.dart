// This class is the model class of Aritcle 

class ArticleModel {
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ArticleModel(
      {this.author,
      this.content,
      this.description,
      this.title,
      this.url,
      this.urlToImage});
}
