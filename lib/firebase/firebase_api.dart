import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseApi{
  static final _firebaseMessaging = FirebaseMessaging.instance;
  static Future<void> initNoti() async{
    await _firebaseMessaging.requestPermission();
    final fCMToken = await _firebaseMessaging.getToken();

    print("Token: $fCMToken");
  }
}