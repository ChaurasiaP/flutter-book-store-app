import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/search_page.dart';
import 'package:book_store_app/UI/view_cart.dart';
import 'package:flutter/material.dart';

Widget titleBar(BuildContext context) =>
    Container(
      color: Colors.orange[400],
      height: MediaQuery.of(context).size.height*0.06,
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));
              },
              child: Image.asset("imgs/bookstore_main.png")),
          Container(
            height: MediaQuery.of(context).size.height*0.06,
            width: MediaQuery.of(context).size.width*0.7,
            decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(7),
                border: Border.all(color: Colors.black54, width: 0.5),
            ),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SearchPage()));
              },
              child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("Search your books"),
                    Icon(Icons.search),
                    // S
                  ]
              ),
            ),
          ),
          SizedBox(width: MediaQuery.of(context).size.width*0.04),
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCart()));
              },
              child: const Icon(Icons.shopping_cart_outlined, color: Colors.black,))
        ],
      ),
    );

Widget bottomNavBar(BuildContext context) =>
    BottomNavigationBar(
      items: [
        BottomNavigationBarItem(icon: InkWell(
            onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => const MainScreen()));}, child: const Icon(Icons.home_outlined, color: Colors.black)), label: "Home"),
        const BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.black), label: "Account"),
        BottomNavigationBarItem(icon: InkWell(
            onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCart())),
            child: const Icon(Icons.shopping_cart_outlined, color: Colors.black)), label: "View Cart"),
        const BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, color: Colors.black), label: "Settings"),
        const BottomNavigationBarItem(icon: Icon(Icons.menu_outlined, color: Colors.black), label: "Menu")
      ],
    );