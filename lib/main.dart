import 'package:flutter/material.dart';
import 'package:nilediting_app/pages/on_boarding.dart';
import 'package:nilediting_app/pages/starter_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? pref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  pref = await SharedPreferences.getInstance();
  //Switch Function Between the Onboarding and HomePage
  // pref.setBool("seen", false);
  bool? seen = pref?.getBool('seen');
  Widget screen;
  if (seen == null || seen == false) {
    screen = const OnBoarding();
  } else {
    screen = const StarterPage();
  }

  runApp(MyApp(screen));
}

class MyApp extends StatelessWidget {
  final Widget screen;

  const MyApp(this.screen, {super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nil Editing',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: screen,
    );
  }
}
