import 'package:flutter/material.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:webview_flutter/webview_flutter.dart';

final webViewKey = GlobalKey<WebViewContainerState>();

class DiscoveryPage extends StatefulWidget {
  const DiscoveryPage({super.key});

  @override
  _DiscoveryPageState createState() => _DiscoveryPageState();
}

class _DiscoveryPageState extends State<DiscoveryPage> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ToolsUtilities.mainColor,
                image: DecorationImage(
                    image: NetworkImage(ToolsUtilities.discoveryImageHeader),
                    fit: BoxFit.cover),
              ),
              child: const Padding(
                padding: EdgeInsets.only(top: 00.0, right: 10, left: 10),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.21,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ToolsUtilities.secondColor.withOpacity(0.4),
              ),
              child: Padding(
                padding: const EdgeInsets.only(top: 00.0, right: 10, left: 10),
                child: _customHeading(),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0, left: 20),
          child: Container(
            color: ToolsUtilities.whiteColor,
            child: const SizedBox(
              height: 2,
            ),
          ),
        ),
        Expanded(
          child: WebViewContainer(key: webViewKey),
        ),
      ],
    );
  }

  Widget _customHeading() {
    return Padding(
      padding: const EdgeInsets.only(top: 60.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Daily New Presets',
              style: TextStyle(
                fontSize: 15,
                color: ToolsUtilities.whiteColor,
              )),
          Row(
            children: [
              const Text(
                'Discover Now',
                style: TextStyle(
                    fontSize: 30,
                    color: ToolsUtilities.whiteColor,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                  width: 80), // Add some space between the text and the button
              ElevatedButton(
                onPressed: () {
                  // using currentState with question mark to ensure it's not null
                  webViewKey.currentState?.reloadWebView();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Background color
                  elevation: 0, // Removes the shadow
                  shadowColor: Colors.transparent, // Removes the shadow color
                ),
                child: const Icon(
                  Icons.refresh,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ],
      ),
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
}
