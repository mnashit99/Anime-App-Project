import 'package:anime_info_application/models/anime.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatefulWidget {
  final Anime product;

  ProductDetailScreen({required this.product});

  @override
  _ProductDetailScreenState createState() => _ProductDetailScreenState();
}

class _ProductDetailScreenState extends State<ProductDetailScreen> {
  late Anime product;
  bool _isFavorite = false;

  @override
  void initState() {
    super.initState();
    product = widget.product;
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color.fromRGBO(194, 194, 194, 0.976),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 255, 255, 255),
          ),
        ),
      ),
      body: SingleChildScrollView(
        // This column is for all the detail displaying on the screen
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // This container is for image
            Container(
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(50),
                ),
                image: DecorationImage(
                  image: AssetImage(
                      product.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Filters buttons
            SizedBox(height: 20),
            // This container is for the small section below the image
            Container(
              padding: EdgeInsets.all(14),
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2,
                  color: Colors.grey,
                ),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Category : ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'times new roman',
                    ),
                  ),
                  Text(
                    product.genre,
                    style: TextStyle(
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(width: 14),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                        size: 24,
                      ),
                      Text(
                        'Rating :',
                        style: TextStyle(
                          color: Color.fromARGB(255, 5, 5, 5),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'times new roman',
                        ),
                      ),
                      SizedBox(width: 5),
                      Text(
                        '${product.rating}',
                        style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // This row will have Title and favourite button alongside it
            Row(
              children: [
                // It puts the space b/w child widgets of Row
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Text(
                    product.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontFamily: 'times new roman',
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      _isFavorite = !_isFavorite;
                      
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            _isFavorite
                                ? 'Added to the favorite list'
                                : 'Removed from the favorite list',
                          ),
                          backgroundColor: _isFavorite
                              ? Color.fromARGB(255, 141, 141, 141)
                              : Colors.red,
                        ),
                      );
                    });
                  },
                  icon: Icon(
                    _isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: _isFavorite ? Colors.red : Colors.white,
                  ),
                ),
                SizedBox(width: 10),
              ],
            ),

            // Description text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(product.description,
                  style: TextStyle(
                      fontSize: 14, color: Color.fromARGB(255, 255, 255, 255))),
            ),
          ],
        ),
      ),
    );
  }
}
