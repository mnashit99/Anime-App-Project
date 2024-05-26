import "package:flutter/material.dart";

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: Color.fromARGB(255, 0, 0, 0),
      selectedItemColor:
          Colors.redAccent, // Set selected icon and label color to redAccent
      unselectedItemColor:
          Colors.grey, // Set unselected icon and label color to grey
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.more), label: "Discover"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Favourites")
      ],
      onTap: (index) {
        switch (index) {
          case 0:
            Navigator.pushNamed(context, "/Home");
            break;
          case 1:
            Navigator.pushNamed(context, "/Discover");
               break;
          case 2:
            Navigator.pushNamed(context, "/Favourites");
             break;
      
          default:
        }
        
      },
    );
  }
}
