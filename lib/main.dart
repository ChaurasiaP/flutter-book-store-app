import 'dart:async';

import 'package:book_store_app/UI/bookstore_index.dart';
import 'package:book_store_app/UI/login_route.dart';
import 'package:book_store_app/firebase_options.dart';
import 'package:book_store_app/services/firebaseAPI.dart';
import 'package:book_store_app/services/shared_pref.dart';
import 'package:book_store_app/style/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MaterialApp(
    home: MyApp(),
  ));
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isLoggedIn = false;

  getLoggedInStatus() async{
    var getStatus = await LocalDataSaver.getLogData();
    getStatus! ? isLoggedIn = true : isLoggedIn = false;
  }

  @override
  void initState() {
    // TODO: implement initState
    getLoggedInStatus();
    Timer(const Duration(seconds: 2), () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => isLoggedIn ? const MainScreen() : const LoginPage())));
  }
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(),
    );
  }
}
