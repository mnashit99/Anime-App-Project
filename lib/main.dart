import 'package:anime_info_application/Screens/DiscoverPage.dart';
import 'package:anime_info_application/Screens/FavouritePage.dart';
import 'package:anime_info_application/Screens/HomePage.dart';
import 'package:anime_info_application/Screens/splashscreen.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(
      DevicePreview(
        enabled: true,
        builder: (context) => AnimeApp(),
      ),
    );

class AnimeApp extends StatefulWidget {
  const AnimeApp({super.key});

  @override
  State<AnimeApp> createState() => _AnimeAppState();
}

class _AnimeAppState extends State<AnimeApp> {
  @override
  void initState() {
    //to hide status bar and below buttons
    //SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: //this set apps background theme
          ThemeData(
              scaffoldBackgroundColor: Color.fromARGB(255, 224, 224, 224)),
      initialRoute: "/",
      routes: {
        "/": (context) => SplashScreen(),
        "/Home": (context) => HomePage(),
        "/Discover": (context) => DiscoverPage(),
        "/Favourites": (context) => FavouritePage(),
      },
    );
  }
}
