import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleView extends StatefulWidget {

  final String postUrl;
  ArticleView({@required this.postUrl});

  @override
  _ArticleViewState createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {

  final Completer<WebViewController> _completer = Completer<WebViewController>();
  final _key = UniqueKey();

  @override
  Widget build(BuildContext context) {
    print('Web View URL : '+widget.postUrl);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("Flutter"),
            Text("News",style: TextStyle(
              color: Colors.blue,
            ),)
          ],
        ),
        actions: <Widget>[
          Opacity(opacity: 0,child: Container(padding: EdgeInsets.symmetric(horizontal: 16),child: Icon(Icons.save))),
        ],
        elevation: 0.0,
        centerTitle: true,
      ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: WebView(
            key: _key,
            initialUrl: widget.postUrl,
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              _completer.complete(webViewController);
            },
          )
        ),
    );
  }
}