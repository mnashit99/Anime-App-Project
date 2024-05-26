import 'package:anime_info_application/Screens/HomePage.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  // Page controller is used to manage and control page view
  final PageController _pageController = PageController();
  //int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    // listener is used whenever page controller changes page
    _pageController.addListener(() {
      setState(() {
        //_currentPage = _pageController.page!.round();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // It is used to show objects over each other
      body: Stack(
        children: [
          //PageView is a widget that allows the user to swipe between different pages of content
          PageView(
            controller: _pageController,
            children: [
              // This container is of first page on welcome screen
              Container(
                decoration: BoxDecoration(
                  // Linear gradient is used to add gradient in the screen's background color
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(194, 194, 194, 0.976),
                      Color.fromRGBO(194, 194, 194, 0.976),
                    ],
                  ),
                ),
                // This column is used to align image and text under it
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // The below function is used to attach image/gif on the page
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                      child: Image.asset(
                        'welcome.gif',
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Welcome to My Anime App!',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Its good to see you here! explore your favorite anime series and discover new ones.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontFamily: 'times new roman',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              // This container is of another page in the welcome screen 
              Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromRGBO(194, 194, 194, 0.976),
                      Color.fromRGBO(194, 194, 194, 0.976),
                    ],
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(200.0),
                        bottomRight: Radius.circular(200.0),
                        topLeft: Radius.circular(200.0),
                        topRight: Radius.circular(200.0),
                      ),
                      child: Image.asset(
                        'service.gif',
                        fit: BoxFit.cover,
                        height: 350,
                      ),
                    ),
                    SizedBox(height: 40),
                    Text(
                      'Our Services',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'You can watch here all your favourite animes for free and get some offers.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: 'times new roman',
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ],
          ),
          // Positioned(
          //   bottom: 20,
          //   left: 0,
          //   right: 0,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       for (int i = 0; i < 2; i++)
          //         Container(
          //           margin: EdgeInsets.symmetric(horizontal: 6),
          //           width: 10,
          //           height: 10,
          //           decoration: BoxDecoration(
          //             shape: BoxShape.circle,
          //             color: _currentPage == i
          //                 ? Color.fromARGB(255, 127, 221, 4)
          //                 : Colors.white.withOpacity(0.5),
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
        ],
      ),
      // This is the bottom navigation bar by which we change pages while remaining on the same screen
      bottomNavigationBar: BottomAppBar(
        color: Color.fromARGB(255, 0, 0, 0),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          // The row is used to align the text in bottom navbar with the icon
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                ' My Anime App',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontFamily: 'times new roman',
                ),
                textAlign: TextAlign.center,
              ),
              // This container is of icon and its border on bottom navbar
              Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: Colors.white,
                    width: 2.0,
                  ),
                ),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    if (_pageController.page! < 1) {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 500),
                        curve: Curves.easeInOut,
                      );
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
