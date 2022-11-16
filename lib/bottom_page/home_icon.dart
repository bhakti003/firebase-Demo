import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/model_foods/food_data.dart';
import 'package:ui/model_foods/foodmodel.dart';
import '../Screen/home_page.dart';
import '../Screen/second_page.dart';
class HomeIcon extends StatefulWidget {
  const HomeIcon({Key? key}) : super(key: key);

  @override
  State<HomeIcon> createState() => _HomeIconState();
}

class _HomeIconState extends State<HomeIcon> {
  @override
  // var index;

  final drawerkey = GlobalKey<ScaffoldState>();
  TextEditingController serachcontroller = TextEditingController();
  openDrawer() {
    drawerkey.currentState!.openDrawer();
  }

  closeDtawer() {
    drawerkey.currentState!.closeDrawer();
  }
  Widget build(BuildContext context) {
   return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 9,right: 9,top: 9),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      drawerkey.currentState!.openDrawer();
                    },
                    child: Icon(
                      Icons.short_text,
                      size: 4.h,
                    )),
                CircleAvatar(
                  radius: 2.5.h,
                  backgroundImage: AssetImage("assets/f1.jpeg"),
                )
              ],
            ),
            Text(
              'Let s Find ',
              style: GoogleFonts.actor(
                  fontWeight: FontWeight.bold, fontSize: 3.5.h),
            ),
            Text(
              'Somthing Delicious!',
              style: GoogleFonts.actor(
                  fontWeight: FontWeight.bold, fontSize: 3.5.h),
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Container(
                height: 6.h,
                width: 110.w,
                child: TextField(
                  controller: serachcontroller,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search_rounded),
                      // suffixIcon: Icon(Icons.add),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: ' Search Cotogarls',
                      hintStyle: TextStyle(fontSize: 2.h),
                      border:OutlineInputBorder(borderRadius: BorderRadius.circular(10))
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 3.5.h,
            ),

            Padding(
              padding: const EdgeInsets.only(left: 300, top: 30),
              child: GestureDetector(
                  onTap: () {},
                  child: Text(
                    'See all',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Color(0xffd80605),
                      fontSize: 2.h,
                      fontWeight: FontWeight.bold,
                    ),
                  )),
            ),
            SizedBox(
              height: 3.5.h,
            ),
            Container(
              height: 60.h,
              child: DefaultTabController(
                length: 4,
                initialIndex: 0,
                child: Container(
                  margin: EdgeInsets.only(),
                  child: Column(
                    children: [
                      Container(
                        child: const TabBar(
                        // onTap: (index){
                        //  print("is Tabbar ${index}");
                        // },
                          unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.normal),
                          unselectedLabelColor:Colors.black38,
                          labelColor: Colors.red,
                          indicatorColor: Colors.red,
                          tabs: [
                            Tab(
                              child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Foods",
                                    style: TextStyle(fontSize: 16),
                                  ) /*CustomWidgets.text(AppStrings.publics)*/),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Drinks",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Snacks",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                            Tab(
                              child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sauce",
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ),
                          ],
                          // labelPadding: EdgeInsets.zero,
                          indicatorPadding: EdgeInsets.all(1.0),
                          indicatorWeight: 0.08,
                          indicatorSize: TabBarIndicatorSize.label,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          ),
                        ),
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            FoodDataWidget(collection: "Foods"),
                            FoodDataWidget(collection: "Drinks",),
                            FoodDataWidget(collection: "Snacks",),
                            FoodDataWidget(collection: "Sauce",),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class FoodDataWidget extends StatefulWidget {
   FoodDataWidget({Key? key, this.collection,}) : super(key: key);
  String? collection;

  @override
  State<FoodDataWidget> createState() => _FoodDataWidgetState();
}

class _FoodDataWidgetState extends State<FoodDataWidget> {
  var itemList=<FoodModel>[].obs;
  var favorite = false;
  @override
  void initState() {
    super.initState();
    getData();
  }
  Future getData() async {
    print("ItemList${widget.collection}");
    itemList.clear();
    var data=await FirebaseFirestore.instance
        .collection("${widget.collection}").get();
          data.docs
        .map((e) => itemList.add(FoodModel.fromJson(e.data())))
        .toList();
  }
  addToFavorite({int? id, bool? isfavorite}) async {
    if(!isfavorite!){
      await FirebaseFirestore.instance
          .collection("${widget.collection}").doc(id.toString()).update({"isFavorite": true} );
    }else{
    await FirebaseFirestore.instance
        .collection("${widget.collection}").doc(id.toString()).update({"isFavorite": false} );
    }
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(() => Container(
        height: 40.h,
        width: 100,
        // color: Color(0xffff4f4f4),
        child:   ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: itemList.length,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            print("itemlist${itemList}");
            return itemList.isEmpty ?Text("No Data",style: TextStyle(color: Colors.red),):
            GestureDetector(onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
            },
              child: Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top:70),
                  child: Container(
                    height: 27.h,
                    width: 42.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white
                    ),
                    child:  Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 10.h,),
                        // Center(child: Text(foodList[index].name!,style: TextStyle(color: Colors.black,fontSize: 21,),textAlign: TextAlign.center,)),
                        // Text('${foodList[index].prices!}.00',style: TextStyle(color: Colors.red,fontSize: 20),),
                        Text(itemList[index].name.toString(),style: TextStyle(color: Colors.black,fontSize: 21),textAlign: TextAlign.center,),
                        SizedBox(height: 1.h,),
                        // Text(itemList[index].catorgy.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
                        Text('\$${itemList[index].price.toString()}.00',style: TextStyle(color: Color(0xffd80605),fontSize: 20),textAlign: TextAlign.center,),
                        GestureDetector(
                            onTap: (){
                              addToFavorite(id:itemList[index].id, isfavorite: itemList[index].isFavorite);
                            },
                            child: Icon(
                              itemList[index].isFavorite! ? Icons.favorite : Icons.favorite_border, color: Color(0xffd80605),),),
                       ],
                    ),
                  ),
                ),
                Positioned(top: 2.sp,left: 16.5.sp,
                    child: CircleAvatar(radius: 8.h,
                  // backgroundImage: FileImage(File(data[index].image.toString())),
                       backgroundImage: NetworkImage(itemList[index].image.toString()),
                      // backgroundImage: AssetImage(foodList[index].image!),
                    )),
              ]),
            );
          },
          separatorBuilder: (context, index) {
            return SizedBox(
              width: 10.w,
            );
          },
        ),
      ))
    );

  }
}
// class DrinksDataWidget extends StatefulWidget {
//   const DrinksDataWidget({Key? key}) : super(key: key);
//   @override
//   State<DrinksDataWidget> createState() => _DrinksDataWidgetState();
// }
//
// class _DrinksDataWidgetState extends State<DrinksDataWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Obx(() => Container(
//           height: 40.h,
//           width: 100,
//           // color: Color(0xffff4f4f4),
//           child:   ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: data.length,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return GestureDetector(onTap: (){
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(
//                 //   // model: foodList[index],
//                 // ),));
//                 setState(() {
//
//                 });
//               },
//                 child: Stack(children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top:70),
//                     child: Container(
//                       height: 27.h,
//                       width: 42.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white
//                       ),
//
//                       child:  Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 10.h,),
//                           // Center(child: Text(foodList[index].name!,style: TextStyle(color: Colors.black,fontSize: 21,),textAlign: TextAlign.center,)),
//                           // Text('${foodList[index].prices!}.00',style: TextStyle(color: Colors.red,fontSize: 20),),
//                           Text(data[index].name.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].catorgy.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].price.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(top: 2.sp,left: 16.5.sp,
//                       child: CircleAvatar(radius: 8.h,
//                         backgroundImage: FileImage(File(data[index].image.toString())),
//                         // backgroundImage: NetworkImage(data[index].image!),
//                         // backgroundImage: AssetImage(foodList[index].image!),
//                       )),
//                 ]),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 width: 10.w,
//               );
//             },
//           ),
//         ))
//     );
//   }
// }
//
// class SnacksDatawidget extends StatefulWidget {
//   const SnacksDatawidget({Key? key}) : super(key: key);
//
//   @override
//   State<SnacksDatawidget> createState() => _SnacksDatawidgetState();
// }
//
// class _SnacksDatawidgetState extends State<SnacksDatawidget> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Obx(() => Container(
//           height: 40.h,
//           width: 100,
//           // color: Color(0xffff4f4f4),
//           child:   ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: data.length,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return GestureDetector(onTap: (){
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(
//                 //   // model: foodList[index],
//                 // ),));
//                 setState(() {
//
//                 });
//               },
//                 child: Stack(children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top:70),
//                     child: Container(
//                       height: 27.h,
//                       width: 42.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white
//                       ),
//
//                       child:  Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 10.h,),
//                           // Center(child: Text(foodList[index].name!,style: TextStyle(color: Colors.black,fontSize: 21,),textAlign: TextAlign.center,)),
//                           // Text('${foodList[index].prices!}.00',style: TextStyle(color: Colors.red,fontSize: 20),),
//                           Text(data[index].name.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].catorgy.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].price.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(top: 2.sp,left: 16.5.sp,
//                       child: CircleAvatar(radius: 8.h,
//                         backgroundImage: FileImage(File(data[index].image.toString())),
//                         // backgroundImage: NetworkImage(data[index].image!),
//                         // backgroundImage: AssetImage(foodList[index].image!),
//                       )),
//                 ]),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 width: 10.w,
//               );
//             },
//           ),
//         ))
//     );
//   }
// }
// class SauceDataWideget extends StatefulWidget {
//   const SauceDataWideget({Key? key}) : super(key: key);
//
//   @override
//   State<SauceDataWideget> createState() => _SauceDataWidegetState();
// }
//
// class _SauceDataWidegetState extends State<SauceDataWideget> {
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//         child: Obx(() => Container(
//           height: 40.h,
//           width: 100,
//           // color: Color(0xffff4f4f4),
//           child:   ListView.separated(
//             scrollDirection: Axis.horizontal,
//             itemCount: data.length,
//             physics: BouncingScrollPhysics(),
//             itemBuilder: (context, index) {
//               return GestureDetector(onTap: (){
//                 //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(
//                 //   // model: foodList[index],
//                 // ),));
//                 setState(() {
//
//                 });
//               },
//                 child: Stack(children: [
//                   Padding(
//                     padding: const EdgeInsets.only(top:70),
//                     child: Container(
//                       height: 27.h,
//                       width: 42.w,
//                       decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30),
//                           color: Colors.white
//                       ),
//
//                       child:  Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           SizedBox(height: 10.h,),
//                           // Center(child: Text(foodList[index].name!,style: TextStyle(color: Colors.black,fontSize: 21,),textAlign: TextAlign.center,)),
//                           // Text('${foodList[index].prices!}.00',style: TextStyle(color: Colors.red,fontSize: 20),),
//                           Text(data[index].name.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].catorgy.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//                           Text(data[index].price.toString(),style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
//
//
//                         ],
//                       ),
//                     ),
//                   ),
//                   Positioned(top: 2.sp,left: 16.5.sp,
//                       child: CircleAvatar(radius: 8.h,
//                         backgroundImage: FileImage(File(data[index].image.toString())),
//                         // backgroundImage: NetworkImage(data[index].image!),
//                         // backgroundImage: AssetImage(foodList[index].image!),
//                       )),
//                 ]),
//               );
//             },
//             separatorBuilder: (context, index) {
//               return SizedBox(
//                 width: 10.w,
//               );
//             },
//           ),
//         ))
//     );
//   }
// }



