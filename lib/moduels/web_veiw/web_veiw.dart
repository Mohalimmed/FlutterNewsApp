import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Web_Veiw extends StatelessWidget {

   late  WebViewController controller;

   final String url;
   Web_Veiw(this.url);

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(),
      body: WebViewWidget(
          controller: WebViewController()
        ..loadRequest(
          Uri.parse(url),
        ),
      ),

    );
  }
}
