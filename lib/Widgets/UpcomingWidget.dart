import 'package:flutter/material.dart';

class UpcomingWidget extends StatelessWidget {
  const UpcomingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Row(
             //this one adds margin b/w texn/put the see all to right corner
            children: [
              Text(
                "Upcoming Animes",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              ),
          
            ],
          ),
        ),
        SizedBox(height: 15),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              for (int i = 1; i <= 10; i++)
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Image.asset(
                    "u$i.jpg",
                    height: 180,
                    width: 300,
                    fit: BoxFit.fill,
                  ),
                )
            ],
          ),
        )
      ],
    );
  }
}
