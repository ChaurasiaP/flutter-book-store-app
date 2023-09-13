import 'dart:async';

import 'package:book_store_app/UI/settings_route.dart';
import 'package:book_store_app/UI/user_account_route.dart';
import 'package:book_store_app/UI/view_cart.dart';
import 'package:book_store_app/services/resources/books_list.dart';
import 'package:book_store_app/style/title_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shimmer/shimmer.dart';

void main(){
  runApp(const MaterialApp(
    home: MainScreen(),
  ));
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  bool isHovered = false;
  bool isTapped = false;
  int onIndex = 0;
  bool isLoading = true;

  List<String> dropDownMenuList = ["Price: low to high",
    "Price: high to low",
    "relevence"
  ];
  late List<Books> booksList;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchBooksList();
    Future.delayed(const Duration(seconds: 1), (){
      setState(() {
        isLoading = false;
      });
    });
  }

  fetchBooksList(){
     booksList = Books.getBookDetails();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange[50],
      body: SafeArea(
        child: Column(
          children: [
            titleBar(context),
            const Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                      children: [
                        Text("Items Count", style: TextStyle(fontSize: 16)),
                        SizedBox(width: 5),
                        Text("(20)", style: TextStyle(fontSize: 12, color: Colors.grey),)
                      ]
                  ),
                ),
              ],
            ),
            Expanded(

              child: _itemsList(),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            onIndex = index;
          });
        },
        currentIndex: onIndex,
        backgroundColor: Colors.orange,
        unselectedItemColor: Colors.black,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: const MainScreen(), type: PageTransitionType.fade));},
                  child: const Icon(Icons.home_outlined, color: Colors.black)),
              label: "Home"),

          BottomNavigationBarItem(
              icon: InkWell(
                onTap: (){
                  Navigator.push(context, PageTransition(child: const UserAccount(), type: PageTransitionType.rightToLeftWithFade));
                },
                  child: const Icon(Icons.person_outline, color: Colors.black)),
              label: "Account"),
          BottomNavigationBarItem(
              icon: InkWell(
              onTap:()=> Navigator.push(context, PageTransition(child: const ViewCart(), type: PageTransitionType.rightToLeftWithFade)),
              child: const Icon(Icons.shopping_cart_outlined, color: Colors.black)), label: "View Cart"),
          BottomNavigationBarItem(icon: InkWell(
              onTap: (){
                Navigator.push(context, PageTransition(child: const SettingsRoute(), type: PageTransitionType.rightToLeftWithFade));
              },
              child: const Icon(Icons.menu_outlined, color: Colors.black)), label: "Menu")
        ],
      ),
    );
  }
  Widget _itemsList() =>
      MasonryGridView.count(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          itemCount: booksList.length,
          itemBuilder: (context, index) =>
              InkWell(
                splashColor: Colors.orangeAccent,
                onHover: (value){},
                onTap: (){

                },

                // item box containing image, description, price and action buttons
                child: isLoading? _shimmerEffect() : Container(
                  decoration: BoxDecoration(
                      color: Colors.white70,
                      border: Border.all(color: Colors.black12)
                  ),
                  height: 270,
                  width: 150,
                  child: InkWell(
                    onHover: (value){
                      Text(booksList[index].description);
                    },
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            _itemImage(index),
                          ],
                        ),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(padding: const EdgeInsets.all(10),
                                child: _itemDetails(index)),
                          ],
                        ),
                         isTapped ? _addedToCart(index) : _actionButtons(index)
                      ],
                    ),
                  ),
                ),
              )
      );

  Widget _itemImage(int index) =>
      Container(  // CONTAINS IMAGE OF THE PRODUCT
        color: Colors.grey[300],
        height: 130,
        child: Image.asset(booksList[index].image),
      );

  Widget _itemDetails(int index) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(booksList[index].bookName, style: const TextStyle(

            overflow: TextOverflow.ellipsis,
              fontSize: 16, fontWeight: FontWeight.w600
          ),),
          Text(booksList[index].author, style: const TextStyle(
              color: Colors.grey
          ),),
          Text(booksList[index].publishedIn, style: const TextStyle(
              color: Colors.grey
          ),),
          Text(booksList[index].price, style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600
          ),),

        ],
      );

  Widget _actionButtons(int index) =>
       Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: 30,
            width: 55,
            child: ElevatedButton(
                style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.orange)
                ),
                onPressed: (){
                  setState(() {
                    isTapped = true;
                  });
                },
                child: const Icon(Icons.add_shopping_cart)),
          ),
          SizedBox(
            height: 30,
            width: 55,
            child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.yellow.shade400)
                ),
                onPressed: (){},
                child: const Icon(FontAwesomeIcons.heart)),
          )
        ],
      );

  Widget _addedToCart(int index) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(Colors.orangeAccent.shade400)
              ),
              onPressed: (){},
              child: const Text("Added to Cart", style: TextStyle(
                  color: Colors.white
              ),)),
        ],
      );

  Widget _shimmerEffect() =>
      Shimmer.fromColors(
        baseColor: Colors.grey.withOpacity(0.5),
        highlightColor: Colors.white,
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white70, border: Border.all(color: Colors.black12)),
          height: 250,
          width: 150,
          child: Column(
            children: [
              Container(
                color: Colors.grey[300],
                height: 120,
              ),
              const SizedBox(height: 5),
              Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 12,
                        width: 120,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 12,
                        width: 100,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 12,
                        width: 100,
                        color: Colors.grey,
                      ),
                      Container(
                        margin: const EdgeInsets.all(5),
                        height: 12,
                        width: 100,
                        color: Colors.grey,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Container(
                            margin: const EdgeInsets.all(5),
                            height: 24,
                            width: 50,
                            color: Colors.grey,
                          ),
                          const SizedBox(width: 20),
                          Container(
                            margin: const EdgeInsets.all(5),
                            height: 24,
                            width: 50,
                            color: Colors.grey,
                          )
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      );

}
