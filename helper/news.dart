import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutternews/views/article_view.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:http/http.dart' as http;

class News{
  List<ArticleModel> news =[];

 Future<void> getNews() async{
   String url="https://newsapi.org/v2/top-headlines?country=us&apiKey=fc9576b2388f4954a56d42727b8144c2";
   var response=await http.get(Uri.parse(url));
   var jsonData= jsonDecode(response.body);
   if(jsonData['status']=='ok'){
     jsonData['articles'].forEach((element){
       if(element['urlToImage']!=null&& element['description']!=null){
         ArticleModel articleModel =ArticleModel(
           author: element['author'] ?? "Unknown",         // Default value
           content: element['content'] ?? "No content",   // Default value
           description: element['description'] ?? "",     // Default value
           title: element['title'] ?? "Untitled",         // Fixed typo and added default
           url: element['url'] ?? "",                     // Default value
           urlToImage: element['urlToImage'] ?? "", );
         news.add(articleModel);

       }
     });
   }
 }
}
class CategoryNewsClass{
  List<ArticleModel> news =[];

  Future<void> getNews(String category) async{
    String url="https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=fc9576b2388f4954a56d42727b8144c2";
    var response=await http.get(Uri.parse(url));
    var jsonData= jsonDecode(response.body);
    if(jsonData['status']=='ok'){
      jsonData['articles'].forEach((element){
        if(element['urlToImage']!=null&& element['description']!=null){
          ArticleModel articleModel =ArticleModel(
            author: element['author'] ?? "Unknown",         // Default value
            content: element['content'] ?? "No content",   // Default value
            description: element['description'] ?? "",     // Default value
            title: element['title'] ?? "Untitled",         // Fixed typo and added default
            url: element['url'] ?? "",                     // Default value
            urlToImage: element['urlToImage'] ?? "", );
          news.add(articleModel);

        }
      });
    }
  }
}