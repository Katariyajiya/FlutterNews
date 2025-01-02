import 'dart:ffi';

import 'package:flutternews/models/category_model.dart';

List<CategoryModel> getCategories() {
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.CategoryName = 'Business';
  categoryModel.imageUrl =
      "assets/images/Business.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'Entertainment';
  categoryModel.imageUrl =
      "assets/images/entertainment.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'General';
  categoryModel.imageUrl = "assets/images/general.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'Health';
  categoryModel.imageUrl =
      "assets/images/health.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'Science';
  categoryModel.imageUrl =
  "assets/images/science.png";
  category.add(categoryModel);

  categoryModel = new CategoryModel();
  categoryModel.CategoryName = 'Technology';
  categoryModel.imageUrl =
  "assets/images/TechWorld.png";
  category.add(categoryModel);

  return category;
}
