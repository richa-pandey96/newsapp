import 'package:flutter/material.dart';
import 'package:newsapp/views/article_views.dart';
import 'package:newsapp/models/articles_model.dart';
import 'package:flutter/services.dart';
import 'package:newsapp/helper/news.dart';
// ignore: duplicate_import
import 'article_views.dart';
// ignore: must_be_immutable
class CategoryNews extends StatefulWidget {
  String category;
  CategoryNews({required this.category});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ArticleModel> articles=<ArticleModel>[];
  bool _loading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    getCategoryNews();
  }
  getCategoryNews() async{
    CategoryNewsClass newsClass=CategoryNewsClass();
    await newsClass.getNews(widget.category);
    articles=newsClass.news;
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
          children: <Widget>[
            Text(
              "News",
              style:
              TextStyle(color: Colors.red, fontWeight: FontWeight.w600,fontSize: 30),
            ),
            Text(
              "Town",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600,fontSize: 30),
            )
          ],
        ),
        actions: <Widget>[
          Opacity(
           opacity:0,
           child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.share,)))
        ],
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body:  _loading?Center(child: CircularProgressIndicator()):SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
              child: ListView.builder(
                // physics: ClampingScrollPhysics(),
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: articles.length,
                itemBuilder: (context,index)
                {
                   return BlogTile(imageUrl: articles[index].urlToImage!, title: articles[index].title!, desc: articles[index].description!,url: articles[index].url!,);
                },
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
class BlogTile extends StatelessWidget {
  String imageUrl,title,desc,url;
  BlogTile({required this.imageUrl,required this.title,required this.desc,required this.url});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>ArticleView(
        blogUrl:url
        )));
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 16),
        child: Column(children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Image.network(imageUrl)),
          SizedBox(height: 8,),
          Text(title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600, color: Colors.black87),),
          SizedBox(height: 8,),
          Text(desc,style: TextStyle(color: Colors.black54),)
        ]),
      ),
    );
  }
}


