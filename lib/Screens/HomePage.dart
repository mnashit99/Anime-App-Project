import 'dart:async';

import 'package:anime_info_application/Screens/anime_screen.dart';
import 'package:anime_info_application/Screens/seeall.dart';
import 'package:anime_info_application/models/anime.dart';
import 'package:anime_info_application/services.dart/animeServices.dart';
import 'package:flutter/material.dart';
import 'package:anime_info_application/Widgets/UpcomingWidget.dart';
import 'package:anime_info_application/Widgets/sidenavbar.dart';
import 'package:anime_info_application/Widgets/bottomnavbar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<String> imageListt = [
    'gon.png',
    'gojoo.png',
    'saitama.png',
    'luffy.png',
    'ere.png',
    'ichigo.png',
    'tanjiro.png',
    'goku.png',
    'uzunaruto.png',
    'kaneki.png',
    'medo.png',
  ];
  final List<String> texxt = [
    'Gon Freecs',
    'Gojo Satoru',
    'Saitama',
    'Monkey D. Luffy',
    'Eren Yeager',
    'Ichigo Kurosaki',
    'tanjiro kamado',
    'Son Goku',
    'Uzumaki Naruto',
    'Ken Kaneki',
    'Izuku Midoriya',
  ];
  final List<String> allimages = [
    'attack.png',
    'one.png',
    'man.png',
    'hunter.png',
    'tokyo.png',
    'blue.png',
    'juju.png',
    'naruto.png',
    'haykiu.png',
    'bleach.png',
    'boy.png',
    'death.png',
    'akame.png',
    'dragon.png',
    'demon.png',
    'hero.png',
    'spy.png',
  ];
  final List<String> textt = [
    'Hunter X Hunter',
    'Jujutsu Kaisen',
    'One Man Punch',
    'One Piece',
    'Attack on Titan',
    'Bleach',
    'Demon Slayer',
    'Dragon Ball',
    'Naruto Shipuden',
    'Tokyo Ghoul',
    'My Hero Academia',
  ];
  List<String> selectedGenres = [];
  final ProductService productService = ProductService();
  int currentIndex = 0;
  late Timer _timer;
  late TextEditingController _searchController;
  late List<String> _filteredAnimeList;
  late List<String> _animeList;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 4), (timer) {
      setState(() {
        currentIndex = (currentIndex + 1) % allimages.length;
      });
    });
    _searchController = TextEditingController();
  }

  @override
  void dispose() {
    _searchController.dispose();
    _timer.cancel();
    super.dispose();
  }

  void _filterAnimeList(String query) {
    setState(() {
      _filteredAnimeList = [];
      if (query.isNotEmpty) {
        // Filter the anime list based on the search query
        for (String anime in _animeList) {
          if (anime.toLowerCase().contains(query.toLowerCase())) {
            _filteredAnimeList.add(anime);
          }
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Anime App",
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 20,
            color: const Color.fromARGB(255, 34, 34, 34),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 190, 190, 190),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Hello! Welcome User",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          "What To Watch?",
                          style: TextStyle(
                            color: Colors.black54,
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.asset(
                        "profile.jpg",
                        height: 50,
                        width: 50,
                      ),
                    ),
                  ],
                ),
              ),

              Container(
                height: 50,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 209, 209, 209),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: const Color.fromARGB(255, 0, 0, 0),
                      size: 25,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextFormField(
                        controller: _searchController,
                        onChanged: _filterAnimeList,
                        style: TextStyle(
                            color: const Color.fromARGB(255, 0, 0, 0)),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search Your Favourite Anime",
                          hintStyle: TextStyle(
                            color: Color.fromARGB(136, 0, 0, 0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: Color.fromARGB(255, 255, 255, 255),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Most popular',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 0, 0, 0),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 0, 0, 0),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(color: Colors.grey),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Seeall()));
                              },
                              child: Text(
                                'See all',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 4),
                      height: 220,
                      width: 380,
                      child: FutureBuilder<List<Anime>>(
                        future: productService.getAnime(),
                        builder: (BuildContext context,
                            AsyncSnapshot<List<Anime>> snapshot) {
                          if (snapshot.hasData) {
                            List<Anime> products = snapshot.data!;
                            if (_searchController.text.isNotEmpty) {
                              products = products
                                  .where((product) => product.title
                                      .toLowerCase()
                                      .contains(
                                          _searchController.text.toLowerCase()))
                                  .toList();
                              if (products.isEmpty) {
                                return Center(
                                  child: Text(
                                    'No anime found',
                                    style: TextStyle(
                                        fontSize: 24,
                                        color: Color.fromARGB(255, 0, 0, 0)),
                                  ),
                                );
                              }
                            }
                            //scolling list section of popular anime
                            return ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: products.length,
                              itemBuilder: (BuildContext context, int index) {
                                Anime product = products[index];
                                return GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            ProductDetailScreen(
                                                product: product),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    margin: EdgeInsets.all(8),
                                    width: 160,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded( 
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(14),
                                            child: Image.asset(
                                              product.image,
                                              fit: BoxFit.cover,
                                              height: 150,
                                              width: 150,
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          product.title,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 5),
                                        Text(
                                          'Episode : ${product.episode.toString()}',
                                          style: TextStyle(
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          // By default, show a loading spinner.
                          return Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                CircularProgressIndicator(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  'Loading...',
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 27, 27, 27)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 20),
              UpcomingWidget(),
              Container(
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 0, 0, 0),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Recommended for you',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                        color:
                                            Color.fromRGBO(158, 158, 158, 1)),
                                  ),
                                  child: TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Seeall()));
                                    },
                                    child: Text(
                                      'See all',
                                      style: TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Wrap(
                                spacing: 10,
                                children: [
                                  FilterButton(
                                    label: 'All',
                                    isSelected: selectedGenres.isEmpty,
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                      });
                                    },
                                  ),
                                  FilterButton(
                                    label: 'Action',
                                    isSelected:
                                        selectedGenres.contains('Action'),
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                        selectedGenres.add('Action');
                                      });
                                    },
                                  ),
                                  FilterButton(
                                    label: 'Drama',
                                    isSelected:
                                        selectedGenres.contains('Drama'),
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                        selectedGenres.add('Drama');
                                      });
                                    },
                                  ),
                                  FilterButton(
                                    label: 'Comedy',
                                    isSelected:
                                        selectedGenres.contains('Comdey'),
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                        selectedGenres.add('Comdey');
                                      });
                                    },
                                  ),
                                  FilterButton(
                                    label: 'Sports',
                                    isSelected:
                                        selectedGenres.contains('Sports'),
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                        selectedGenres.add('Sports');
                                      });
                                    },
                                  ),
                                  FilterButton(
                                    label: 'Romance',
                                    isSelected:
                                        selectedGenres.contains('Romance'),
                                    onPressed: () {
                                      setState(() {
                                        selectedGenres.clear();
                                        selectedGenres.add('Romance');
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            height: 220,
                            width: 380,
                            child: FutureBuilder<List<Anime>>(
                              future: productService.getAnime(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<List<Anime>> snapshot) {
                                if (snapshot.hasData) {
                                  List<Anime> products = snapshot.data!;
                                  if (selectedGenres.isNotEmpty) {
                                    products = products
                                        .where((product) => selectedGenres
                                            .contains(product.genre))
                                        .toList();
                                  }

                                  if (products.isEmpty) {
                                    return Center(
                                      child: Text(
                                        'No anime found for selected genres',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    );
                                  }

                                  return ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: products.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      Anime product = products[index];
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductDetailScreen(
                                                      product: product),
                                            ),
                                          );
                                        },
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          width: 160,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Expanded(
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(14),
                                                  child: Image.asset(
                                                    product.image,
                                                    fit: BoxFit.cover,
                                                    height: 150,
                                                    width: 150,
                                                  ),
                                                ),
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                product.title,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 190, 190, 190),
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                              SizedBox(height: 5),
                                              Text(
                                                'Episode : ${product.episode.toString()}',
                                                style: TextStyle(
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                } else if (snapshot.hasError) {
                                  return Text("${snapshot.error}");
                                } else {
                                  // By default, show a loading spinner.
                                  return Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        CircularProgressIndicator(
                                          color: Colors.white,
                                        ),
                                        SizedBox(height: 10.0),
                                        Text(
                                          'Loading...',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          //container for characters section
                          Container(
                            decoration: BoxDecoration(
                              color:  Color.fromARGB(255, 190, 190, 190),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20.0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Characters',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 200,
                                  child: ListView.builder(
                                    itemCount: imageListt.length,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: () {},
                                        child: Container(
                                          margin: EdgeInsets.all(8),
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.4,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                                child: Image.asset(
                                                  imageListt[index],
                                                  fit: BoxFit.cover,
                                                  height: 100,
                                                  width: 100,
                                                ),
                                              ),
                                              SizedBox(height: 10),
                                              Text(
                                                texxt[index],
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: 'times new roman',
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                ),
                                              ),
                                              
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                SizedBox(height: 10),
                              ],
                            ),
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
      ),
      drawer: SideDrawer(),
      bottomNavigationBar: MyBottomNavBar(),
    );
  }
}
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback? onPressed;

  const FilterButton({
    Key? key,
    required this.label,
    this.isSelected = false,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
        isSelected ? Color.fromARGB(255, 0, 0, 0) : Colors.white;
    final textColor =
        isSelected ? Color.fromARGB(255, 255, 255, 255) : Colors.black;
    final borderColor = isSelected
        ? Color.fromARGB(255, 255, 255, 255)
        : Color.fromARGB(255, 255, 255, 255);

    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: borderColor,
            width: 2,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: textColor,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
