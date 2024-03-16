import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

void main() {
  runApp(const MyApp());
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
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background pic-f.jpg',
              fit: BoxFit.cover,
            ),
          ),
          // User info container
          const Positioned(
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
              width: 120.0,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white70, width: 2.5),
                  borderRadius: BorderRadius.circular(8.0) // Add border
                  ),
              child: ClipRRect(
                // Use ClipRRect to clip the child widget to fit within the container
                borderRadius: BorderRadius.circular(
                    10.0), // Adjust border radius as needed
                child: LinearPercentIndicator(
                  lineHeight: 14.0,
                  percent: 0.5,
                  padding: const EdgeInsets.symmetric(
                      horizontal:
                          2.0), // Adjust padding to keep indicator within the border
                  backgroundColor: Colors.black54,
                  progressColor: Colors.red,
                  animation: true,
                  animationDuration: 1000,
                ),
              ),
            ),
          ),

          // Bottom navigation bar with notch
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: BottomAppBar(
              color: Colors.black, // Adjusted for dark theme
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.home,
                        color: Colors.white), // Adjusted icon color
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
                    icon: const Icon(Icons.people,
                        color: Colors.white), // Adjusted icon color
                    onPressed: () {},
                  ),
                  IconButton(
                    iconSize: 32,
                    icon: const Icon(Icons.settings,
                        color: Colors.white), // Adjusted icon color
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

  const UserInfo(
      {super.key, required this.avatarUrl,
      required this.userName,
      required this.userLevel});

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
        const SizedBox(width: 10), // Spacing between avatar and text
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Name
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                userName,
                style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 5), // Vertical spacing between name and level
            // Level
            Container(
              padding: const EdgeInsets.all(4),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                'Level: $userLevel',
                style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
