import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/login_route.dart';
import 'package:book_store_app/UI/user_account_route.dart';
import 'package:book_store_app/UI/view_cart.dart';
import 'package:book_store_app/services/shared_pref.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class SettingsRoute extends StatefulWidget {
  const SettingsRoute({super.key});

  @override
  State<SettingsRoute> createState() => _SettingsRouteState();
}

class _SettingsRouteState extends State<SettingsRoute> {
  int onIndex = 3;

  @override
  Widget build(BuildContext context) {
    var _size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.orange[100],
      body: SafeArea(
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                alignment: Alignment.topLeft,
                height: _size.height*0.20,
                width: _size.width,
                decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(150) //BorderRadius.only(bottomLeft: Radius.circular(150), bottomRight: Radius.circular(150))
                 ),
                child: Image.asset("assets/logo/bookstore_main.png", fit: BoxFit.cover,),
              ),
              Container(
                padding: const EdgeInsets.only(left: 25),
                alignment: Alignment.topLeft,
                  height: _size.height*0.2,
                  width: _size.width,
                  child: const Text("Settings ", style: TextStyle(
                fontWeight: FontWeight.w600, fontSize: 50
              ),)),
              Column(
                children: [
                  InkWell(
                    splashColor: Colors.orange,
                    onTap: (){},
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none),),
                      child: const Row(
                        children: [
                          SizedBox(width: 25),
                          Icon(Icons.shopping_cart_outlined, size: 40),
                          SizedBox(width: 50),
                          Text("My Cart", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),)
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    splashColor: Colors.orange,
                    onTap: (){},
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none),),
                      child: const Row(
                        children: [
                          SizedBox(width: 25),
                          Icon(Icons.manage_accounts_outlined, size: 40),
                          SizedBox(width: 50),
                          Text("Account Settings", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: (){},
                    splashColor: Colors.orange,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none),),
                      child: const Row(
                        children: [
                          SizedBox(width: 25),
                          Icon(Icons.feedback_outlined, size: 40),
                          SizedBox(width: 50),
                          Text("Feedback", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  InkWell(
                    onTap: () async{
                      await FirebaseAuth.instance.signOut().then((_) => LocalDataSaver.saveLogData(false));
                      Navigator.push(context, PageTransition(child: const LoginPage(), type: PageTransitionType.bottomToTop, duration: Duration(milliseconds: 500) ));
                    },
                    splashColor: Colors.orange,
                    child: Container(
                      decoration: const BoxDecoration(
                        border: Border(bottom: BorderSide(color: Colors.black), top: BorderSide.none, left: BorderSide.none, right: BorderSide.none),),
                      child: const Row(
                        children: [
                          SizedBox(width: 25),
                          Icon(Icons.logout_outlined, size: 40),
                          SizedBox(width: 50),
                          Text("Sign Out", style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500))
                        ],
                      ),
                    ),
                  )
                ],
              )
            ]
        ),
          )
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
            // route to main screen
              icon: InkWell(
                  onTap: (){
                    Navigator.push(context, PageTransition(child: const MainScreen(), type: PageTransitionType.leftToRightWithFade));},
                  child: const Icon(Icons.home_outlined, color: Colors.black)),
              label: "Home"),

          // route to user account screen
          BottomNavigationBarItem(
              icon: InkWell(
                onTap:(){
                  Navigator.push(context, PageTransition(child: const UserAccount(), type: PageTransitionType.leftToRightWithFade));
                },
                  child: const Icon(Icons.person_outline, color: Colors.black)),
              label: "Account"),

          // route to cart screen
          BottomNavigationBarItem(icon: InkWell(
              onTap:()=> Navigator.push(context, PageTransition(child: const ViewCart(), type: PageTransitionType.leftToRightWithFade)),
              child: const Icon(Icons.shopping_cart_outlined, color: Colors.black)), label: "View Cart"),

          // route to settings drawer
          BottomNavigationBarItem(icon: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const SettingsRoute()));
              },
              child: const Icon(Icons.menu_outlined, color: Colors.black)), label: "Menu")
        ],
      ),
    );
  }
}
