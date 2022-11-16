

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dropdown_button2/custom_dropdown_button2.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ui/Screen/second_page.dart';
import 'package:ui/model_foods/foodmodel.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../model_foods/food_data.dart';
import 'home_icon.dart';

class AddIcon extends StatefulWidget {
  const AddIcon({Key? key}) : super(key: key);

  @override
  State<AddIcon> createState() => _AddIconState();
}

class _AddIconState extends State<AddIcon> {
  TextEditingController pricesController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;
  final ImagePicker _picker = ImagePicker();
  var downloadloadedurl = "".obs;
  // File? imageshow;
  var data = <FoodModel>[].obs;
  // bool favorite = false;
 var imageshow;
  String? selectedValue;
  var item = ['Foods','Drinks','Snacks','Sauce',];
  @override
  void initState() {
    super.initState();
    setUserData();
    setState(() {

    });
  }
  setUserData() async {
  //   final FirebaseAuth auth = FirebaseAuth.instance;
  //   await FirebaseFirestore.instance
  //       .collection('Food')
  //       .doc((data.length + 1).toString())
  //       // .doc(data.toString())
  //       .set({'image' : imageshow,'catorgy' : categoryController.text,
  //   'name' : selectedValue,'price' : pricesController.text});
  // // print("name : ${categoryController.text}");
  // // print("price : ${pricesController.text}");
  // // print("name : ${item}");
  // // print("image  : ${imageshow}");
  //         // SetOptions(merge: true);
  //         // print('Data Set');
  //       // .set(data.toSet())
  //       // // .doc().set(data.t);
    print(" new add Data${data.length}");
      await uploadImage();
     print("addData set${data.length}");
  }
  Future uploadImage() async {
    var ref = FirebaseStorage.instance
        .ref()
        .child('FoodImages/${imageshow.toString()}');
    await ref.putFile(imageshow!).then((value) async {
      downloadloadedurl.value = await ref.getDownloadURL();
      print(downloadloadedurl);
    });

    print("URL${downloadloadedurl.value}");

    await FirebaseFirestore.instance
        // .collection("${selectedValue}")
    .collection("${selectedValue}")
        .doc((data.length + 1).toString())
        .set({
      'id': data.length + 1,
      'catorgy' : selectedValue,
      'image': downloadloadedurl.value,
      'name' : nameController.text,
      'price' : pricesController.text,
      'isFavorite' : false
    });

  }

  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: Column(children: [
          SizedBox(height: 3.h),
          Center(
              child: CircleAvatar(
                backgroundColor: Colors.grey,
                radius: 8.h,
                child: ClipOval(
                  child: imageshow != null
                      //   ? Image.file(File(imageshow!),
                      // fit: BoxFit.fill,width: 33.w,height: 20.h,)
                        ? Image.file(imageshow!,fit: BoxFit.fill,width: 33.w,height: 20.h,)
                        :GestureDetector(
                      onTap: () async {
                        final XFile? image = await _picker.pickImage(
                            source: ImageSource.gallery);
                        setState(() {
                          // imageshow = File(image!.path);
                          imageshow = File(image!.path);
                          print("imageshow ${imageshow}");
                        });
                      },
                      child: Center(child: Icon(Icons.camera_alt,color: Colors.black,),)),
                ),
              )
          ),
          SizedBox(height: 3.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter name',
              ),
            ),
          ),
            // child: DropdownButton<String>(
            //   items: itemList.map((value) => DropdownMenuItem<String>(value : value,
            //       child: Text(value))).toList(),value: item != null ? item : null,
            //   onChanged: (String? name){
            //     setState(() {
            //       item = name!;
            //     });
            //   },
            //   elevation: 20,
            //     hint: Text("   Enter some item"),
            //     icon: Icon(Icons.keyboard_arrow_down),
            //     isExpanded: false,
            //     borderRadius: BorderRadius.circular(20),
            // ),
          SizedBox(height: 2.h,),
            CustomDropdownButton2(
              hint: 'Category',
              buttonWidth: 95.w,
              buttonHeight: 7.5.h,
              dropdownWidth: 68.5.w,
              buttonDecoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                  border: Border.all(color: Colors.black38)),
              dropdownItems: item,
              value: selectedValue,
              onChanged: (value) {
                setState(() {
                  selectedValue = value;
                });
              },
            ),
          SizedBox(height: 2.h,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              controller: pricesController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                hintText: 'Enter Prices',
              ),
            ),
          ),
          SizedBox(height: 2.h,),
          GestureDetector(onTap: (){

            setUserData();
            setState((){});
            print("selected ${selectedValue}");
            // Navigator.push(context, MaterialPageRoute(builder: (context) => HomeIcon(),));
             // favorite;
          },
            child: Container(
              height: 8.h,
              width: 33.w,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Center(child: Text("ADD",style: TextStyle(fontSize: 20),),),
            ),
          ),
       ],
        ),
      ),
    );
  }
}