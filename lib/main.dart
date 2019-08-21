import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'customIcons.dart';
import 'style.dart';
import 'model/model.dart';
import 'widgets/productCard.dart';
import 'package:bubble_bottom_bar/bubble_bottom_bar.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
      debugShowCheckedModeBanner: false,
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = 0;
  }

  void changePage(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFf3f6fb),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16.0, right: 16.0, top: 30.0, bottom: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  IconButton(iconSize: 34, icon: Icon(Icons.subject), onPressed: () {}),
                  IconButton(iconSize: 34, icon: Icon(Icons.local_grocery_store), onPressed: () {}),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 25.0),
              child: Text(
                "Shop",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 22.0,
            ),
            Container(
              width: double.infinity,
              height: 60.0,
              margin: EdgeInsets.symmetric(horizontal: 22),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: [BoxShadow(blurRadius: 30, color: Colors.black.withOpacity(.12), offset: Offset(0, 10))],
              ),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(left: 18, right: 22),
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none,
                        hintStyle: searchBarStyle,
                        suffixIcon: Icon(Icons.search)),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(left: 25),
              child: Text(
                "Headphones",
                style: headingStyle,
              ),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              height: 240,
              child: ListView.builder(
                  itemCount: products.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var product = products[index];
                    return ProductCard(imgUrl: product.image, name: product.title, color: product.color);
                  }),
            ),
            Container(
              width: double.infinity,
              height: 160,
              margin: EdgeInsets.symmetric(horizontal: 22),
//              color: Colors.amber,
              child: Stack(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 8),
                    child: Text(
                      "Speakers",
                      style: headingStyle,
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: Container(
                          height: 100,
                          width: double.infinity,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [BoxShadow(color: Colors.black12, offset: Offset(0, 6), blurRadius: 6)]),
                          child: Padding(
                            padding: EdgeInsets.only(left: 22, top: 16),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Abdyl",
                                  style: productTitleStyle,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  "Hauted Red, Slate Blue,\nMist Grey",
                                  style: productSubTitleStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                  Positioned(
                    top: -15,
                    right: -5,
                    child: Image.asset(
                      "assets/images/bag.png",
                      width: 150,
                      height: 170,
                      fit: BoxFit.cover,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: BubbleBottomBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            opacity: 1,
            currentIndex: _currentIndex,
            onTap: changePage,
            items: <BubbleBottomBarItem>[
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.home, color: Colors.black),
                  activeIcon: Icon(
                    Icons.home,
                    color: Colors.white,
                  ),
                  title: Text("Home", style: bottomBarStyle)),
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.shopping_basket, color: Colors.black),
                  activeIcon: Icon(
                    Icons.shopping_basket,
                    color: Colors.white,
                  ),
                  title: Text("Shop", style: bottomBarStyle)),
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.favorite_border, color: Colors.black),
                  activeIcon: Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                  ),
                  title: Text("Favorite", style: bottomBarStyle)),
              BubbleBottomBarItem(
                  backgroundColor: Colors.black,
                  icon: Icon(Icons.person, color: Colors.black),
                  activeIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text("Profile", style: bottomBarStyle))
            ],
          )
      ),
    );
  }
}
