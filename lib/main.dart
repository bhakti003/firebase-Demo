import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/Screen/home_page.dart';
import 'package:ui/Screen/second_page.dart';
import 'package:ui/user/sign_up.dart';
import 'bottom_page/add_icon.dart';
import 'Screen/first_page.dart';
import 'user/login_page.dart';
import 'bottom_page/favorite_icon.dart';
import 'bottom_page/home_icon.dart';
import 'bottom_page/location_icon.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, orientation, deviceType) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home:  FirstPage(),
      );
    },);

  }
}




