import 'package:flutter/material.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<WebViewContainerState>();

class AllPostsPage extends StatefulWidget {
  const AllPostsPage({super.key});

  @override
  AllPostsPageState createState() => AllPostsPageState();
}

class AllPostsPageState extends State<AllPostsPage> {
  bool isLoading = true;

  @override
  void initState() {
    setState(() {
      isLoading = false;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("All New Posts"),
        backgroundColor: ToolsUtilities.mainColor,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              // using currentState with question mark to ensure it's not null
              webViewKey.currentState?.reloadWebView();
            },
          )
        ],
      ),
      body: WebViewContainer(key: webViewKey),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  const WebViewContainer({required Key key}) : super(key: key);

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
      initialUrl: ToolsUtilities.homePageUrl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }

  void reloadWebView() {
    _webViewController.reload();
  }

  Widget _customHeading() {
    return const Padding(
      padding: EdgeInsets.only(top: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Daily New Stories',
              style: TextStyle(
                fontSize: 15,
                color: ToolsUtilities.whiteColor,
              )),
          Text(
            'Discovery Now',
            style: TextStyle(
                fontSize: 30,
                color: ToolsUtilities.whiteColor,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
