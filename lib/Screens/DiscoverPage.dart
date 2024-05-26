import 'package:anime_info_application/Widgets/sidenavbar.dart';
import 'package:flutter/material.dart';

class DiscoverPage extends StatelessWidget {
  const DiscoverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
         backgroundColor: Color.fromARGB(255, 190, 190, 190),
      ),
        drawer: SideDrawer(),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: const Color.fromARGB(255, 0, 0, 0),
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 30),
                    Text(
                      "Discover",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                child: Column(
                  children: [
                    for (int i = 1; i < 11; i++)
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: InkWell(
                          onTap: () {
                            // Handle category tap here
                            print("Category $i tapped");
                          },
                          child: Row(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.asset(
                                  "u$i.jpg",
                                  height: 70,
                                  width: 90,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Category $i",
                                style: TextStyle(fontSize: 22, color: Colors.black),
                              ),
                              Spacer(),
                              InkWell(
                                onTap: () {
                                  // Handle icon tap here
                                  print("Icon of Category $i tapped");
                                },
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  color: Colors.black,
                                  size: 25,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    
    );
  }
}
