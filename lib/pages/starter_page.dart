import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:nilediting_app/pages/about_us.dart';
import 'package:nilediting_app/pages/categories_page.dart';
import 'package:nilediting_app/pages/discoverypage.dart';
import 'package:nilediting_app/pages/contact_us_page.dart';
import 'package:nilediting_app/pages/all_posts_page.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';

class StarterPage extends StatefulWidget {
  const StarterPage({super.key});

  @override
  _StarterPageState createState() => _StarterPageState();
}

class _StarterPageState extends State<StarterPage> {
  int _page = 2;
  final GlobalKey _bottomNavigationKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    List<Widget> tabs = [
      const AboutUs(),
      const CategoriesPage(),
      const DiscoveryPage(),
      const AllPostsPage(),
      const ContactUsPage()
    ];

    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        index: 2,
        height: 50.0,
        items: const <Widget>[
          Icon(Icons.info, color: ToolsUtilities.whiteColor, size: 20),
          Icon(Icons.calendar_view_day,
              color: ToolsUtilities.whiteColor, size: 20),
          Icon(Icons.whatshot, color: ToolsUtilities.whiteColor, size: 20),
          Icon(Icons.list, color: ToolsUtilities.whiteColor, size: 20),
          Icon(Icons.email, color: ToolsUtilities.whiteColor, size: 20),
        ],
        color: ToolsUtilities.mainColor,
        buttonBackgroundColor: ToolsUtilities.mainColor,
        backgroundColor: ToolsUtilities.whiteColor,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 200),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: tabs[_page],
    );
  }
}
