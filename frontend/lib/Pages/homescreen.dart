import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        bottomNavigationBarTheme: BottomNavigationBarTheme.of(context).copyWith(
          backgroundColor: Colors.black,
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white,
        ),
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background6.png',
              fit: BoxFit.cover,
            ),
          ),
          // User info container
          Positioned(
            top: 35,
            left: 20,
            child: UserInfo(
              avatarUrl: 'https://example.com/avatar.jpg',
              userName: 'Senali Wij',
              userLevel: 1,
            ),
          ),

          Positioned(
            top: 38.0,
            right: 20.0,
            child: Container(
              width: 150.0, // Adjusted width to accommodate the heart image and the linear percentage indicators
              height: 45.0, // Adjusted height to accommodate both linear percentage indicators
              child: Stack(
                children: [
                  // HP Indicator
                  Positioned(
                    left: 0.0,
                    top: 0.0,
                    child: Image.asset('assets/heart.png.png', width: 24.0, height: 24.0),
                  ),
                  Positioned(
                    left: 30.0, // Adjusted left position to create space for the heart image
                    top: 3.0, // Adjusted top position to center the HP indicator vertically
                    right: 2.0, // Adjusted right position to leave space for the border
                    bottom: 28.0, // Adjusted bottom position to leave space for the border and XP indicator
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2.0),

                      ),
                      child: LinearPercentIndicator(
                        lineHeight: 20.0, // Adjusted line height to match the height of the heart image
                        percent: 1.0,
                        padding: EdgeInsets.zero, // Removed padding to ensure full width of the container
                        backgroundColor: Colors.black54,
                        progressColor: Colors.red,
                        animation: true,
                        animationDuration: 1000,
                      ),
                    ),
                  ),
                  // XP Indicator
                  Positioned(
                    left: 0.0,
                    top: 25.0,
                    child: Image.asset('assets/flash.png', width: 24.0, height: 24.0),
                  ),
                  Positioned(
                    left: 30.0, // Adjusted left position to create space for the heart image
                    top: 25.0, // Adjusted top position to center the XP indicator vertically
                    right: 2.0, // Adjusted right position to leave space for the border
                    bottom: 3.0, // Adjusted bottom position to leave space for the border
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white70, width: 2.0),
                      ),
                      child: LinearPercentIndicator(
                        lineHeight: 20.0, // Adjusted line height to match the height of the heart image
                        percent: 1.0,
                        padding: EdgeInsets.zero, // Removed padding to ensure full width of the container
                        backgroundColor: Colors.black54,
                        progressColor: Colors.yellow,
                        animation: true,
                        animationDuration: 1000,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom navigation bar with notch
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              color: Colors.black,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.home, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Image.asset(
                      'assets/dragon.png',
                      width: 30,
                      height: 30,
                    ),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.person, color: Colors.white),
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.settings, color: Colors.white),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
          floatingActionButton: Padding(
            padding: const EdgeInsets.only(bottom: 55.0),
            child: Container(
              width: 60,
              height: 60,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 4.0), // Black border
              ),
              child: const ClipOval(
                child: Material(
                  color: Colors.white,
                  child: Icon(
                    Icons.camera_alt_outlined,
                    size: 36,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        );
      }
    }

class UserInfo extends StatelessWidget {
  final String avatarUrl;
  final String userName;
  final int userLevel;

  UserInfo({required this.avatarUrl, required this.userName, required this.userLevel});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        // Avatar
        CircleAvatar(
          radius: 30,
          backgroundImage: NetworkImage(avatarUrl),
        ),
        SizedBox(width: 10), // Spacing between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                userName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            SizedBox(height: 5), // Vertical spacing between name and level
            // Level
            Container(
              padding: EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                'Level: $userLevel',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

