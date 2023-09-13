import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/settings_route.dart';
import 'package:book_store_app/UI/search_page.dart';
import 'package:book_store_app/UI/user_account_route.dart';
import 'package:book_store_app/UI/view_cart.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

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
              child: Image.asset("assets/logo/bookstore_main.png")),
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
      backgroundColor: Colors.orange,
      // unselectedItemColor: Colors.black,
      // unselectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        BottomNavigationBarItem(
            icon: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
              const MainScreen()));},
                child: const Icon(Icons.home_outlined, color: Colors.black)),
            label: "Home"),
        const BottomNavigationBarItem(icon: Icon(Icons.person_outline, color: Colors.black), label: "Account"),
        // BottomNavigationBarItem(icon: Icon(Icons.home_outlined, color: Colors.black), label: "Home"),
        BottomNavigationBarItem(icon: InkWell(
            onTap:()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const ViewCart())),
            child: const Icon(Icons.shopping_cart_outlined, color: Colors.black)), label: "View Cart"),
        BottomNavigationBarItem(icon: InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>SettingsRoute()));
            },
            child: Icon(Icons.menu_outlined, color: Colors.black)), label: "Menu"),
        BottomNavigationBarItem(icon: InkWell(
            onTap: (){
              Navigator.push(context, PageTransition(child: UserAccount(), type: PageTransitionType.leftToRightWithFade));
            },
            child: Icon(Icons.add)), label: "hi")
      ],
    );