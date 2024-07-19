// import 'package:auto_mentorx/main.dart';
// import 'package:firebase_analytics/firebase_analytics.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
//
// class FirebaseApi {
//
//   //create an instance of Firebase Messaging
//   final _firebaseMessaging = FirebaseMessaging.instance;
//
//   // function to initialize notifications
//   Future<void> initNotifications() async {
//
//     // request permission from user (will prompt user)
//     await _firebaseMessaging.requestPermission();
//
//     // fetch the FCM token for this device
//     final fcmToken = await _firebaseMessaging.getToken();
//
//     // print the token
//     print('===========Token $fcmToken');
//
//     initPushNotification();
//   }
//
//   // function to handle received messages
//   void handleMessage(RemoteMessage? message) {
//     // if the msg is null, do nothing
//     if (message == null) return;
//     // navigate to new screen when msg is received and user tap
//
//     navigatorKey.currentState?.pushNamed('/noif',
//         arguments: message
//     );
//
//
//   }
//
// // function to initialize foreground and background settings
// Future initPushNotification()async{
//     FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
//
//     FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);
//     //FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
//   //FirebaseAnalytics analytics = FirebaseAnalytics.instance;
//
// }
// }
