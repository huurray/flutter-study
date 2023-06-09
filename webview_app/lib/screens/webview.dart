import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, required this.url});

  final String url;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;
  final _cookieManager = WebViewCookieManager();

  @override
  void initState() {
    super.initState();

    // [from flutter to web 방법 1]
    _cookieManager.setCookie(WebViewCookie(
      name: 'token',
      value: '123123',
      domain: widget.url,
    ));

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..addJavaScriptChannel('Soulsociety', onMessageReceived: (message) {
        // [from web to flutter]
        var data = jsonDecode(message.message);
        print(data);
      })
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (_) {
            // [from flutter to web 방법 2]
            controller.runJavaScript(
                'document.querySelector(".test").innerHTML = "hahah"');
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: WebViewWidget(controller: controller),
      ),
    );
  }
}


/* 
- 웹 코드 예시

[Web -> Flutter]
// @ts-ignore
Soulsociety.postMessage(JSON.stringify(object));

[from flutter to web 방법 1]
const value = Cookies.get(`token`);

[from flutter to web 방법 2]
// @ts-ignore
window.initWebview = (authFromFlutter) => {
  const data = JSON.parse(authFromFlutter);
};
*/