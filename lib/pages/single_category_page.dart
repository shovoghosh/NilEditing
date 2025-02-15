import 'package:flutter/material.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<WebViewContainerState>();

class SingleCategoryPage extends StatefulWidget {
  final String categoryUrl;
  final String categoryName;

  const SingleCategoryPage(this.categoryUrl, this.categoryName, {super.key});

  @override
  SingleCategoryPageState createState() => SingleCategoryPageState();
}

class SingleCategoryPageState extends State<SingleCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName,
            style: const TextStyle(color: Colors.white)),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.refresh,
              color: Colors.white,
            ),
            onPressed: () {
              // using currentState with question mark to ensure it's not null
              webViewKey.currentState?.reloadWebView();
            },
          )
        ],
      ),
      body: WebViewContainer(widget.categoryUrl, key: webViewKey),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  final String categoryUrl;
  const WebViewContainer(this.categoryUrl, {required Key key})
      : super(key: key);

  @override
  WebViewContainerState createState() => WebViewContainerState();
}

class WebViewContainerState extends State<WebViewContainer> {
  late WebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return WebView(
      onWebViewCreated: (controller) {
        _webViewController = controller;
      },
      initialUrl: widget.categoryUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  void reloadWebView() {
    _webViewController.reload();
    print(widget.categoryUrl);
  }
}
