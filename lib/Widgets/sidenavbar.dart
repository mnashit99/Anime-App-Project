import 'package:anime_info_application/Screens/MorePage.dart';
import 'package:flutter/material.dart';
import 'package:anime_info_application/Screens/HomePage.dart';
import 'package:anime_info_application/Screens/DiscoverPage.dart';
import 'package:anime_info_application/Screens/FavouritePage.dart';

class SideDrawer extends StatelessWidget {
  const SideDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
     
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      child: ListView(
        children: buildMenuItems(context),
      ),
    );
  }

  List<Widget> buildMenuItems(BuildContext context) {
    List<Widget> menuItems = [];

    menuItems.add(const DrawerHeader(
        child: Text(
      "Anime App",
      
      style: TextStyle(fontSize: 30),
      
    )));

    final Map<String, IconData> menuData = {
      "Home": Icons.home,
      "Discover": Icons.search,
      "Favourites": Icons.favorite,
      "More": Icons.more_horiz,
    };

    menuData.forEach((title, icon) {
      menuItems.add(ListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 18),
        ),
        leading: Icon(
          icon,
          color: const Color.fromARGB(255, 0, 0, 0), // Set the color to white
        ),
        onTap: () {
          Widget screen = Container();
          switch (title) {
            case "Home":
              screen = HomePage();
              break;
            case "Discover":
              screen = DiscoverPage();
              break;
            case "Favourites":
              screen = FavouritePage();
              break;
                case "More":
              screen = MorePage();
              break;
              
            default:
          }

          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => screen));
        },
      ));
    });

    return menuItems;
  }
}
