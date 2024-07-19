// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
//
// class NotificationScreen extends StatelessWidget {
//   static String routeName = "/notif";
//
//   const NotificationScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final arguments = ModalRoute.of(context)!.settings.arguments;
//
//     // Check if arguments is not null and is of type RemoteMessage
//     if (arguments != null && arguments is RemoteMessage) {
//       final msg = arguments as RemoteMessage;
//
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Notifications'),
//         ),
//         body: Column(
//           children: [
//             Text(msg.notification?.title ?? 'No title'),
//             Text(msg.notification?.body ?? 'No body'),
//             Text(msg.data.toString())
//           ],
//         ),
//       );
//     } else {
//       // Handle the case where arguments is null or not of type RemoteMessage
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('Invalid arguments type'),
//         ),
//       );
//     }
//   }
// }
