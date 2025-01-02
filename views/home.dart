import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutternews/helper/data.dart';
import 'package:flutternews/models/article_model.dart';
import 'package:flutternews/models/category_model.dart';
import 'package:flutternews/views/article_view.dart';
import 'package:flutternews/views/category_news.dart';

import '../helper/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories =[];
  List<ArticleModel> articles=[];
  bool _loading = true;

  @override
  void initState(){
    super.initState();
    categories=getCategories();
    getNews();
  }
  getNews() async{
    News newsClass =News();
    await newsClass.getNews();
    articles =newsClass.news;

     setState(() {
       _loading=false;
     });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Flutter'),
            Text('News',style: TextStyle(
              color: Colors.blue,
            ),)
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body:_loading? Container(
        padding: EdgeInsets.symmetric(horizontal: 16,),
        alignment: Alignment.center,
        child: CircularProgressIndicator(
          color: Colors.blue,
        ),
      ):SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 70,
                  child:ListView.builder(
                    itemCount: categories.length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        CategoryName: categories[index].CategoryName
                      );
                    },
                  ),
              ),

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
class CategoryTile extends StatelessWidget {
  final imageUrl,CategoryName;
  const CategoryTile({super.key,this.imageUrl,this.CategoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(
            builder: (context)=>CategoryNews(category: CategoryName.toLowerCase(),)));
      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: Image.asset(imageUrl,width: 120,height:60,fit: BoxFit.cover,)),
            Container(
              width: 120,
              height: 60,
              alignment: Alignment.center,
              decoration:BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ) ,
              child: Text(CategoryName,style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),) ,
            )
          ],
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String imageUrl, title,desc,url;
  BlogTile({required this.imageUrl,required this.title,required this.desc,required this.url });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(blogUrl: url,)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(imageUrl:  imageUrl,)),
            SizedBox(height: 8,),
            Text(title , style: TextStyle(
              color: Colors.black87,
              fontSize: 17,
              fontWeight: FontWeight.w600
            ),),
            SizedBox(height: 8,),
            Text(desc,style: TextStyle(
              color: Colors.grey,
              fontSize: 13
            ),),
      
          ]

        ),
      ),
    );
  }
}
