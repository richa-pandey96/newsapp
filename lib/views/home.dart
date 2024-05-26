import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:flutter/widgets.dart';
import 'package:newsapp/helper/data.dart';
import 'package:newsapp/helper/news.dart';
import 'package:newsapp/models/category_models.dart';
import'package:newsapp/models/articles_model.dart';
import 'package:newsapp/views/article_views.dart';
import 'package:newsapp/views/category_news.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories=<CategoryModel>[];
  List<ArticleModel> articles=<ArticleModel>[];
  bool _loading=true;

  //List<CategoryModel> categories =new List<CategoryModel>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    categories=getCategories();
    getNews();
  }

  getNews() async{
    News newsClass=News();
    await newsClass.getNews();
    articles=newsClass.news;
    setState(() {
      _loading=false;

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation:0.0,
        title: Row(
          mainAxisAlignment:MainAxisAlignment.center ,
          children: [
            Text('News' ,
            style: TextStyle(color: Colors.red,fontWeight: FontWeight.w600,fontSize: 30),            
            ),
            Text(
              'Town',
              style: TextStyle(
              color: Colors.blue,fontWeight: FontWeight.w600,fontSize: 30
            ),
            ),
          ],
        ),
      ),
      body:_loading ?Center(
          child: CircularProgressIndicator()
        ): SingleChildScrollView(
          child: Column(
            children: [
              ///Categories
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context,index){
                      return CategoryTile(
                        imageUrl: categories[index].imageUrl,
                        categoryName: categories[index].categoryName,
        
                      );
                  }
        
                ),
              ),

              /// Blogs
              Container(
                padding: EdgeInsets.all(10),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  itemCount: articles.length,
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                    return BlogTile(
                        imageUrl: articles[index].urlToImage!,
                        title: articles[index].title!,
                        desc: articles[index].description!,
                        url:articles[index].url!,
                    );
                  },
        
                ),
              )
            ],
          ),
        ),
      );
  }
}

class CategoryTile extends StatelessWidget {

  String imageUrl="", categoryName="";
  CategoryTile({required this.imageUrl,required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context,MaterialPageRoute(builder: (context)=>CategoryNews(category:categoryName.toLowerCase())));

      },
      child: Container(
        margin: EdgeInsets.only(right: 16),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(6),
                child: CachedNetworkImage(imageUrl:imageUrl, width: 120,height: 60, fit: BoxFit.cover,)
            ),
            Container(
              alignment: Alignment.center,
              width: 120,height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.black26,
              ),
              //color: Colors.black26,

              child: Text(categoryName, style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),),
            ),
          ],
        ),
      ),
    );
  }
}

CateogryNews({required String category}) {
}

class BlogTile extends StatelessWidget {

  String imageUrl, title,desc,url;
  BlogTile({super.key, required this.imageUrl,required this.title,required this.desc,required this.url});

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
    




