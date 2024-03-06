  import 'package:flutter/material.dart';
  import 'splash.dart';
  import 'homescreen.dart';
  import 'character_customization.dart';

  final navigatorKey = GlobalKey<NavigatorState>();
  // final GlobalKey<NavigatorState> splashNavigatorKey = GlobalKey();
  // final GlobalKey<NavigatorState> homeScreenNavigatorKey = GlobalKey();
  // final GlobalKey<NavigatorState> characterCustomizationNavigatorKey = GlobalKey();
void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      // Define initial route for loading the first screen
      initialRoute: '/splash',

      routes: {
        '/splash': (context) => PageOne(),
        '/homescreen': (context) =>  HomeScreen(), // Use HomeScreen from Page2
        '/character_customization': (context) =>  Character_cust(), // Use HomeScreen from Page3
      },
    );
  }
}