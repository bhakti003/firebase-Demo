import 'dart:core';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ui/model_foods/foodmodel.dart';

class FoodData{
    final FirebaseAuth auth = FirebaseAuth.instance;
    Future setUserData(Map<String,dynamic> map) async {
      await FirebaseFirestore.instance
          .collection('Foods')
          .doc().set(map);
    }
}
List<FoodModel> foodList = [];
class DrinksData{
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future setUserData(Map<String,dynamic> map) async {
    await FirebaseFirestore.instance
        .collection('Drinks')
        .doc().set(map);
  }
}
List<FoodModel> drinksList = [];

class SnacksData{
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future setUserData(Map<String,dynamic> map) async {
    await FirebaseFirestore.instance
        .collection('Snacks').doc().set(map);
  }
}
List<FoodModel> snacksList = [];

class Sauce{
  final FirebaseAuth auth = FirebaseAuth.instance;
  Future setUserData(Map<String,dynamic> map) async {
    await FirebaseFirestore.instance
        .collection('Sauce').doc().set(map);
  }
}
List<FoodModel> sauseList = [];

