// import 'dart:io';
//
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:ui/second.dart';
//
// class AddScreen extends StatefulWidget {
//   const AddScreen({Key? key}) : super(key: key);
//
//   @override
//   State<AddScreen> createState() => _AddScreenState();
// }
//
// class _AddScreenState extends State<AddScreen> {
//   final ImagePicker _picker = ImagePicker();
//   var nameList = ['Falafal', 'pasta', 'pizza', 'juice', 'cake'];
//   var nameController = TextEditingController();
//   var descController = TextEditingController();
//   var priceController = TextEditingController();
//   final _formkey = GlobalKey<FormState>();
//   final FirebaseAuth auth = FirebaseAuth.instance;
//   final value = 5;
//   var item;
//   File? imageshow;
//   var downloadloadedurl = "".obs;
//   var i;
//   @override
//   void initState() {
//     super.initState();
//     setUserData();
//     setState(() {
//       Catagory();
//     });
//   }
//
//   setUserData() async {
//     print("LENGTH${data.length}");
//     await uploadImage();
//
//     print('Data Set');
//     // .set(data.toSet());
//     // .doc().set(data.t);
//   }
//
//   Future uploadImage() async {
//     var ref = FirebaseStorage.instance
//         .ref()
//         .child('FoodImages/${imageshow.toString()}');
//     await ref.putFile(imageshow!).then((value) async {
//       downloadloadedurl.value = await ref.getDownloadURL();
//       print(downloadloadedurl);
//     });
//
//     print("URL${downloadloadedurl.value}");
//
//     await FirebaseFirestore.instance
//         .collection('HotelDetail')
//         .doc((data.length + 1).toString())
//         .set({
//       'name': nameController.text,
//       'image': downloadloadedurl.value,
//       'desc': item,
//       'price': priceController.text
//     });
//   }
//
//   Future<void> Catagory() async {
//     await FirebaseFirestore.instance
//         .collection('Category')
//         .doc(data.toString())
//         .set({
//       'desc': nameList[item],
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.only(top: 10),
//                   child: CircleAvatar(
//                     backgroundColor: Color(0xfff25220),
//                     radius: 80,
//                     child: ClipOval(
//                       child: imageshow != null
//                           ? Image.file(
//                         imageshow!,
//                         fit: BoxFit.fill,
//                         height: 1000,
//                         width: 1000,
//                       )
//                           : GestureDetector(
//                           onTap: () async {
//                             final XFile? image = await _picker.pickImage(
//                                 source: ImageSource.gallery);
//                             setState(() {
//                               imageshow = File(image!.path);
//                               print("imageshow ${imageshow}");
//                             });
//                           },
//                           child: Icon(
//                             Icons.add_a_photo,
//                             size: 30,
//                           )),
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: TextFormField(
//                   controller: nameController,
//                   decoration: InputDecoration(
//                     hintText: "Enter food name",
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 width: 350,
//                 child: DropdownButton(
//                   borderRadius: BorderRadius.all(Radius.circular(10)),
//                   itemHeight: 60,
//                   hint: Text("Enter Catagory"),
//                   items: nameList
//                       .map((value) => DropdownMenuItem<String>(
//                       value: value, child: Text(value)))
//                       .toList(),
//                   value: item != null ? item : null,
//                   onChanged: (value) {
//                     setState(() {});
//                     item = value;
//                     print("Catagory ${item}");
//                   },
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: TextFormField(
//                   controller: priceController,
//                   decoration: InputDecoration(
//                     hintText: "Enter food price",
//                   ),
//                 ),
//               ),
//               GestureDetector(
//                 onTap: () {
//                   setUserData();
//                   setState(() {});
//                 },
//                 child: Container(
//                   height: 45,
//                   width: 140,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.all(Radius.circular(10)),
//                     color: Colors.black,
//                   ),
//                   child: Center(
//                     child: Text(
//                       "ADD",
//                       style: TextStyle(
//                         fontSize: 17,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               )
//             ],
//           )),
//     );
//   }
// }




// FileImage(File(data[index].image.toString())),
