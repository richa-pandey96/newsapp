import 'package:flutter/material.dart';
import 'package:newsapp/views/article_views.dart';

class CateogryNews extends StatefulWidget {
  const CateogryNews({super.key});

  @override
  State<CateogryNews> createState() => _CateogryNewsState();
}

class _CateogryNewsState extends State<CateogryNews> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
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

