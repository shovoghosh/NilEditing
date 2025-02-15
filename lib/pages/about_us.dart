import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> customURlLaunch(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
    throw 'Could not launch $url';
  }
}

class AboutUs extends StatefulWidget {
  const AboutUs({super.key});

  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {
  final List<Map<String, dynamic>> socialMediaLinks = [
    {
      'icon': FontAwesomeIcons.facebook,
      'url': 'https://www.facebook.com/Nilediting'
    },
    {'icon': FontAwesomeIcons.twitter, 'url': 'https://x.com/nilediting'},
    {
      'icon': FontAwesomeIcons.instagram,
      'url': 'https://www.instagram.com/nil.editing/'
    },
    {'icon': FontAwesomeIcons.globe, 'url': 'https://nilediting.com/'},
    {
      'icon': FontAwesomeIcons.pinterest,
      'url': 'https://www.pinterest.com/nilediting/'
    },
    {
      'icon': FontAwesomeIcons.youtube,
      'url': 'https://www.youtube.com/nilediting'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ToolsUtilities.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ToolsUtilities.mainColor,
                    image: DecorationImage(
                        image: NetworkImage(ToolsUtilities.infoHeaderImage),
                        fit: BoxFit.cover),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.only(top: 00.0, right: 10, left: 10),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height * 0.30,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: ToolsUtilities.secondColor.withOpacity(0.4),
                  ),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 100.0, right: 10, left: 10),
                      child: Text(
                        "About - Nil Editing ",
                        style: TextStyle(
                            color: ToolsUtilities.whiteColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 30),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 20, bottom: 8.0, left: 10),
                    child: Text(
                      'Follow Us ',
                      style: TextStyle(
                          color: ToolsUtilities.mainColor,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: socialMediaLinks.map((link) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              customURlLaunch(link['url']);
                            },
                            child: Icon(
                              link['icon'],
                              color: Colors.blue, // Change the color as needed
                              size: 30.0, // Change the size as needed
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                  _aboutUsCard(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Create about Us Card
  Widget _aboutUsCard() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //name Of our Company or Brand
        const Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'We here For You ',
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        //name Of our Vision or Brand

        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 18),
          child: Text(
            'Our Vision ',
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ToolsUtilities.visionImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ToolsUtilities.infoParagraphVision,
                    style: const TextStyle(
                      color: ToolsUtilities.secondColor,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),

        //Our Mission
        const Padding(
          padding: EdgeInsets.only(left: 8.0, top: 10),
          child: Text(
            'Our Mission ',
            style: TextStyle(
                color: ToolsUtilities.mainColor,
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, left: 8, right: 8),
          child: Card(
            child: Column(
              children: [
                Container(
                  height: 200,
                  width: 450,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(ToolsUtilities.missionImage),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    ToolsUtilities.infoParagraphMission,
                    style: const TextStyle(
                      color: ToolsUtilities.secondColor,
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
