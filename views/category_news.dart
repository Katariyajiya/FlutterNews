import 'package:flutter/material.dart';
import 'package:flutternews/models/article_model.dart';

import '../helper/news.dart';
import 'home.dart';
class CategoryNews extends StatefulWidget {
  final String category;
  const CategoryNews({super.key,required this.category});
  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles =[];
  bool _loading=true;
  @override
  void initState(){
    super.initState();
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass =CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles =newsClass.news;

    setState(() {
      _loading=false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text("News",style: TextStyle(color: Colors.blue),)
          ],
        ),
        actions: [
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.save),
            ),
          )
        ],
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading? Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ):SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16,),
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  itemCount: articles.length
                  ,itemBuilder: (context,index){
                return BlogTile(imageUrl: articles[index].urlToImage,
                  title: articles[index].title,
                  desc:articles[index].description,
                  url: articles[index].url,);

                  }),

            )
          ],
        ),
      ),
    );
  }
}
