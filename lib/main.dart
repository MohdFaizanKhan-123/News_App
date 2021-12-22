import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:signin/HomeScree.dart';
import 'package:signin/screens/gmail.dart';
import 'package:signin/screens/signIn.dart';
import 'package:signin/subscreens/Info.dart';
import 'package:signin/subscreens/covid.dart';
import 'package:signin/subscreens/mainDrawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Ubuntu',
          primaryColor: Colors.white,
        ),
        home: News());
  }
}
