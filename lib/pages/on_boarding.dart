import 'package:flutter/material.dart';
import 'package:nilediting_app/pages/starter_page.dart';
import 'package:nilediting_app/utilites/on_boarding_model.dart';
import 'package:nilediting_app/utilites/tools_utilities.dart';
import 'package:shared_preferences/shared_preferences.dart';

List<OnBoardingModel> dataUtilits = [
  OnBoardingModel(
      'In our app, you will gain access to exclusive, premium presets & video tutorials that are unavailable anywhere else and receive step-by-step instructions on how to install and use our presets for both mobile and computer',
      'assets/images/1.png'),
  OnBoardingModel(
      'Our presets are carefully crafted and designed to help you achieve professional-grade results with just one click. Our packages come with various presets catering to different photography styles and aesthetics, including wedding, landscape, & fashion.',
      'assets/images/3.png'),
  OnBoardingModel(
      'Our LUTs are compatible with most video editing software, including Adobe Premiere Pro, Final Cut Pro, DaVinci Resolve, and more. They can be applied to both raw and edited footage, making it easy for you to achieve stunning results in your video projects.',
      'assets/images/2.png'),
];

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  bool _reachatend = false;
  late PageController _pageController;

  @override
  void initState() {
    // TODO: implement initState
    _pageController = PageController(
      initialPage: 0,
    );

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Flexible(
          child: PageView.builder(
              physics: const ClampingScrollPhysics(),
              itemCount: dataUtilits.length,
              controller: _pageController,
              onPageChanged: (index) {
                if (index == (dataUtilits.length - 1)) {
                  setState(() {
                    _reachatend = true;
                    currentIndex = index;
                  });
                } else {
                  setState(() {
                    _reachatend = false;
                    currentIndex = index;
                  });
                }
              },
              itemBuilder: (context, index) {
                return Scaffold(
                  backgroundColor: ToolsUtilities.mainColor,
                  appBar: AppBar(
                    actions: <Widget>[
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0, // Text and icon color
                        ),
                        onPressed: () {},
                        child: _reachatend
                            ? InkWell(
                                onTap: () {
                                  _updateSeen();

                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StarterPage()));
                                },
                                child: const Text(
                                  'Start',
                                  style: TextStyle(
                                      color: ToolsUtilities.whiteColor,
                                      fontSize: 18),
                                ))
                            : InkWell(
                                onTap: () {
                                  _updateSeen();
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const StarterPage()));
                                },
                                child: const Text(
                                  'Skip',
                                  style: TextStyle(
                                      color: ToolsUtilities.whiteColor,
                                      fontSize: 18),
                                )),
                      ),
                    ],
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                  ),
                  body: Padding(
                    padding: const EdgeInsets.only(top: 48),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _customImgBg(index, ToolsUtilities.whiteColor),
                          const SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(18.0),
                            child: Text(
                              dataUtilits[index].title,
                              style: const TextStyle(
                                color: ToolsUtilities.whiteColor,
                                fontSize: 14,
                                fontWeight: FontWeight.w200,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
        ),
        Container(
          color: ToolsUtilities.mainColor,
          child: Transform.translate(
            offset: Offset(0, MediaQuery.of(context).size.height * -0.15),
            child: Container(
              color: Colors.transparent,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: _drawDots(dataUtilits.length),
              ),
            ),
          ),
        ),
      ],
    );
  }

  //Create image with Different Bg Color
  Widget _customImgBg(int index, Color color) {
    return Container(
      width: 800,
      height: 350,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        image: DecorationImage(
            image: ExactAssetImage(dataUtilits[index].image),
            fit: BoxFit.contain),
      ),
    );
  }

//Create list of draw Dots
  List<Widget> _drawDots(int quantity) {
    List<Widget> widgets = [];
    for (int index = 0; index < quantity; index++) {
      widgets.add(
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 30,
            height: 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (index == currentIndex)
                  ? ToolsUtilities.secondColor
                  : ToolsUtilities.whiteColor,
            ),
          ),
        ),
      );
    }
    return widgets;
  }

  void _updateSeen() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setBool('seen', true);
  }
}
