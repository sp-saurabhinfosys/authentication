import 'package:firebase_messaging/firebase_messaging.dart';

class FunFirebaseMessaging {
  FirebaseMessaging _firebaseMessaging = new FirebaseMessaging();
  static String myToken;
   static String getToken() {
    String clientToken = FirebaseMessaging().getToken().then((token) {
      print("Token Init: " + token.toString());
    }

    ).toString();
    myToken = clientToken;
    return clientToken;
  }


}