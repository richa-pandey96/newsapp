import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String blogUrl;
  ArticleView({required this.blogUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _controller = Completer<WebViewController>();
  bool _isloading=true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    print("is wale me aya h ");
    _isloading=false;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "Hot",
              style:
              TextStyle(color: Colors.red, fontWeight: FontWeight.w600,fontSize: 30),
            ),
            Text(
              " News",
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
      body: _isloading?Center(child: CircularProgressIndicator()): Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        // child: WebView(
        //   initialUrl:  widget.blogUrl,
        //   onWebViewCreated: (WebViewController webViewController){
        //     _controller.complete(webViewController);
        //   },
        //   ),
        
     ),
);
}
}

