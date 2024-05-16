import 'package:news_app/models/category_model.dart';

// Function to get a list of predefined categories
List<CategoryModel> getCategories() {
  // Initialize an empty list to store category models
  List<CategoryModel> category = [];

  CategoryModel categoryModel = new CategoryModel();

 // Add "Business" category
  categoryModel.categoryName = "Business";
  categoryModel.image = "images/businessCategory.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

 // Add "Entertainment" category
  categoryModel.categoryName = "Entertainment";
  categoryModel.image = "images/entertainmentCategory.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


 // Add "General" category
  categoryModel.categoryName = "General";
  categoryModel.image = "images/generalCategrory.jpg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

 // Add "Health" category
  categoryModel.categoryName = "Health";
  categoryModel.image = "images/healthCategory.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();

// Add "Sports" category
  categoryModel.categoryName = "Sports";
  categoryModel.image = "images/sportsCategory.jpeg";
  category.add(categoryModel);
  categoryModel = new CategoryModel();


// Return the list of category models
  return category;
}
