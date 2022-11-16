

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/bottom_page/add_icon.dart';
import 'package:ui/Screen/home_page.dart';
import 'package:ui/bottom_page/favorite_icon.dart';
import 'package:ui/bottom_page/home_icon.dart';
import 'package:ui/bottom_page/location_icon.dart';
import 'package:ui/model_foods/model.dart';
import '../model_foods/foodmodel.dart';

 var data = <FoodModel>[].obs;

class SecondPage extends StatefulWidget {
  const SecondPage({Key? key}) : super(key: key);

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage>
    with SingleTickerProviderStateMixin{
  final drawerkey = GlobalKey<ScaffoldState>();
  TextEditingController serachcontroller = TextEditingController();
 int selectedIndex = 0;


   // TabController _controller= TabController(length: 5, vsync: this);


  @override
  void initState() {
    // getUserData();

    super.initState();

  }
  // getUserData() async {
  //   var userData = await FirebaseFirestore.instance
  //       .collection('Food')
  //       .get();
  //   print("USERDATA${userData}");
  //   userData.docs
  //       .map((e) => data.add(FoodModel.fromJson(e.data())))
  //       .toList();
  //   print("USERDATA${data[1].catorgy}");
  // }
  openDrawer() {
    drawerkey.currentState!.openDrawer();
  }

  closeDtawer() {
    drawerkey.currentState!.closeDrawer();
  }
  static const List<Widget> _widgetOptions = <Widget>[
    HomeIcon(),
    FavoriteIcon(),
    AddIcon(),
    LocationIcon()
  ];
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: selectedIndex,
            iconSize: 20,
            onTap:  _onItemTapped,
            type: BottomNavigationBarType.fixed,
            elevation: 1,
            backgroundColor: Color(0xffebefef),
            selectedItemColor:Color(0xffd80605),

            items: [
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  size: 4.h,
                ),
                  label: ""

              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.favorite,
                    size: 4.h,
                  ),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.add,
                    size: 4.h,
                  ),
                  label: ""
              ),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.watch_later,
                    size: 4.h,
                  ),
                  label: ""
              ),
            ],
          ),
          key: drawerkey,
          drawer: Drawer(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                      accountName: Text('Shree Patel'),
                      accountEmail: Text('shreepatel@gmail.com')),
                  Customlist(
                      onTap: () {
                        closeDtawer();
                      },
                      icon: Icon(Icons.abc),
                      text: 'Menu')
                ],
              ),

              backgroundColor: Colors.grey.withOpacity(0.2)),
          backgroundColor: Color(0xffebefef),
          body: _widgetOptions.elementAt(selectedIndex),

      ),
    );
  }

  ListTile Customlist({Icon? icon, String? text, void Function()? onTap}) {
    return ListTile(
      onTap: onTap,
      leading: icon,
      title: Text(text!),
    );
  }
}

