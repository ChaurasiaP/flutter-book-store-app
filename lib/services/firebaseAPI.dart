import 'package:book_store_app/services/shared_pref.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class FirebaseApi {
  final _messaging = FirebaseMessaging.instance;
  static late final deviceTokenID;
  Future<void> initNotifications() async {
    await _messaging.requestPermission();
    {
      await FirebaseMessaging.instance.getToken().then((value) =>
      deviceTokenID = value);
      LocalDataSaver.saveDevice(deviceTokenID);
      debugPrint("token: $deviceTokenID");
    }
  }
// final fCMtoken = _messaging.getToken().then((value) =>deviceTokenID = value).then((_) => LocalDataSaver.saveDevice(deviceTokenID));}
}