//this class is the model class for the category  which will hold the article details.

class ShowCategoryModel{
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? content;

  ShowCategoryModel(
      {this.author,
      this.content,
      this.description,
      this.title,
      this.url,
      this.urlToImage});
}
