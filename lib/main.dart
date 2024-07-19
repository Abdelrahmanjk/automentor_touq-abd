import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/routes.dart';
import 'package:auto_mentorx/screens/splash/splash_screen.dart';
import 'package:auto_mentorx/theme.dart';

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyB6-3q7mGJJh12wCg7eY4ITy58lfdAMe3U',
      authDomain: 'auto-mintorx.firebaseapp.com',
      projectId: 'auto-mintorx',
      messagingSenderId: '921794004450',
      appId: '1:921794004450:android:66ae78e58e7d79c8f525bb',
    ),
  );
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Flutter Way - Template',
      theme: AppTheme.lightTheme(context),
      initialRoute: SplashScreen.routeName,
      routes: routes,
      navigatorKey: navigatorKey,

    );
  }
}