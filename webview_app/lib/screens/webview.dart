import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key, required this.url});

  final String url;

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  final GlobalKey _webViewKey = GlobalKey();

  final CookieManager _cookieManager = CookieManager.instance();

  InAppWebViewController? _webViewController;

  var settings = InAppWebViewSettings(
    sharedCookiesEnabled: true,
    mediaPlaybackRequiresUserGesture: false,
    allowsInlineMediaPlayback: true,
    iframeAllow: "camera; microphone;",
    iframeAllowFullscreen: true,
    javaScriptCanOpenWindowsAutomatically: true,
  );

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      //하드웨어 백키 눌렀을 때
      onWillPop: () {
        if (_webViewController == null) {
          _webViewController!
              .canGoBack()
              .then((value) => Navigator.of(context).pop());
        }
        return Future(() => false);
      },
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
        ),
        body: SafeArea(
          bottom: false,
          child: InAppWebView(
            key: _webViewKey,
            initialUrlRequest: URLRequest(url: WebUri(widget.url)),
            initialSettings: settings,
            onWebViewCreated: (controller) {
              _webViewController = controller;

              controller.addJavaScriptHandler(
                  handlerName: 'JS_INTERFACE_NAME',
                  callback: (args) async {
                    var actKey = '';
                    if (args.isNotEmpty && args[0].isNotEmpty) {
                      actKey = args[0]['actKey'];
                      dynamic data = args[0];

                      //Javascript Handler별도 생성후 처리
                    }
                  });
            },
            onLoadStop: (controller, url) async {
              await _cookieManager.setCookie(
                url: WebUri(widget.url),
                name: '_soul_token',
                value: '123123',
              );
            },
            onPermissionRequest: (controller, request) async {
              return PermissionResponse(
                resources: request.resources,
                action: PermissionResponseAction.GRANT,
              );
            },
          ),
        ),
      ),
    );
  }
}


/* 
- 웹 코드 예시
[Web -> Flutter]
// @ts-ignore
window?.flutter_inappwebview?.callHandler("JS_INTERFACE_NAME", ...args);

[from flutter to web
const token = Cookies.get(`_soul_token`);
*/