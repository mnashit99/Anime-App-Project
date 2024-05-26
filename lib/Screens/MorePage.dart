import 'package:anime_info_application/Widgets/sidenavbar.dart';
import 'package:flutter/material.dart';

class MorePage extends StatelessWidget {
    const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "More Section",
            style: TextStyle(color: Color.fromARGB(255, 34, 34, 34)),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent, // Making app bar transparent
          elevation: 100, // Removing shadow
        ),
        drawer: SideDrawer(),
        // bottomNavigationBar: BottomNavigationBar(),
        extendBodyBehindAppBar: true, // Extend body behind app bar

        body: Stack(
          children: [
            // Background Animation
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [const Color.fromARGB(255, 255, 255, 255), const Color.fromARGB(255, 204, 204, 204)],
                  ),
                ),
              ),
            ),
            // Center Content
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Text Widget with Animated Decorations
                  AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.easeInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.7),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Column(
                      children: [
                        Text(
                          "APP UI IS MADE BY",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "REHAN & NASHIT",
                          style: TextStyle(fontSize: 30, fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
