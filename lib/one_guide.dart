import 'dart:io';

import 'package:flutter/material.dart';
import 'package:test_flutter_project/models/guide.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OneGuide extends StatefulWidget {

  Guide guide;
  OneGuide(this.guide);

  @override
  OneGuideState createState() => OneGuideState(guide);
}

class OneGuideState extends State<OneGuide> {

  Guide guide;
  OneGuideState(this.guide);

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('${guide.name} details')),
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(Icons.arrow_back),
        ),
      ),
      body: WebView(
        initialUrl: 'https://guidebook.com${guide.url}',
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
}