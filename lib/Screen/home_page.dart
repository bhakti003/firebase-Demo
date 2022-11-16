import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:ui/Screen/second_page.dart';

import '../model_foods/model.dart';

class HomePage extends StatefulWidget {
  Foods? model;

  HomePage({Key? key,this.model}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool favorite = false;
  int _count = 0;
  bool isSelected1 = false;
  bool isSelected2 = false;
  bool isSelected3 = false;
  bool isSelected4 = false;
  double fullRating= 0;

  void increment() {
    setState(() {
      _count++;
    });
  }

  void decrement() {
    if (_count != 0) {
      setState(() {
        _count--;
      });
    } else {
      _count = 0;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffffffff),
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                GestureDetector(onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (context) => SecondPage(),));
                },
                  child: Container(
                    height: 42.h,
                    width: 100.w,
                    color: Color(0xffffffff),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5,right: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        favorite = !favorite;
                                      });
                                    },
                                    child: Icon(
                                      favorite
                                          ? Icons.favorite
                                          : Icons.favorite_border_outlined,
                                      color:Color(0xffd80605),
                                      size: 4.h,
                                    )),
                              ],
                            ),
                            Text(
                             widget.model!.name!,
                              style: GoogleFonts.actor(
                                  fontSize: 4.h, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 3.h,
                            ),
                            Text('With an oven rack in the middle, preheat oven to 375 degrees Fahrenheit Pour 1/4 cup of the olive oill into a large,rimmed baking sheetand turn until the pan is evenly coated',
                              style: TextStyle(
                                fontSize: 1.8.h,
                              ),
                              textAlign: TextAlign.justify,
                              //softWrap: true,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                 widget.model!.prices!,
                                  style:
                                      TextStyle(fontSize: 5.5.h, color:Color(0xffd80605)),
                                ),
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(
                      top: 39.h,
                    ),
                    height: 53.h,
                    width: 110.w,
                    decoration: BoxDecoration(
                        color: Color(0xfff4f4f4),
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(10.h))),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 120, left: 14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.circle_rounded,
                                size: 1.9.h,
                                color: Color(0xffd80605)
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'Tomato',
                                style: TextStyle(
                                    fontSize: 1.9.h,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.circle_rounded,
                                size: 1.5.h,
                                color: Color(0xffd80605)
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'Raw red onion',
                                style: TextStyle(
                                    fontSize: 1.9.h,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.circle_rounded,
                                size: 1.5.h,
                                color: Color(0xffd80605),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'Fish',
                                style: TextStyle(
                                    fontSize: 1.9.h,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Icon(
                                Icons.circle_rounded,
                                size: 1.5.h,
                                color: Color(0xffd80605),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Text(
                                'Pitted',
                                style: TextStyle(
                                    fontSize: 1.9.h,
                                    fontWeight: FontWeight.normal),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          Text(
                            "Add Extra Topping",
                            style: TextStyle(fontSize: 3.h),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                         Row(
                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                           children: [
                            GestureDetector(onTap: (){
                              setState(() {
                                isSelected1 = !isSelected1;
                              });
                            },
                              child: isSelected1
                                ?Container(
                                height: 5.h,
                                width: 22.w,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color(0xffd80605)),
                                child: Center(child: Text('Paper',style: TextStyle(color: Colors.white),)),
                              )

                             : Padding(padding: EdgeInsets.only(),
                             child: Container(height: 5.h,width: 22.w,
                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border:Border.all(width: 1,color: Color(0xffd80605)), ),
                               child: Center(child: Text('Paper',style: TextStyle(color : Color(0xffd80605),)),
                             ),
                             ),
                             )
                           ),
                             GestureDetector(onTap: (){
                               setState(() {
                                 isSelected2 = !isSelected2;
                               });
                             },
                                 child: isSelected2
                                     ?Container(
                                   height: 5.h,
                                   width: 22.w,
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color(0xffd80605)),
                                   child: Center(child: Text('Salt',style: TextStyle(color: Colors.white),)),
                                 )

                                     : Padding(padding: EdgeInsets.only(),
                                   child: Container(height: 5.h,width: 22.w,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border:Border.all(width: 1,color: Color(0xffd80605)), ),
                                     child: Center(child: Text('Salt',style: TextStyle(color : Color(0xffd80605),)),
                                     ),
                                   ),
                                 )
                             ),
                             GestureDetector(onTap: (){
                               setState(() {
                                 isSelected3 = !isSelected3;
                               });
                             },
                                 child: isSelected3
                                     ?Container(
                                   height: 5.h,
                                   width: 22.w,
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color(0xffd80605)),
                                   child: Center(child: Text('Souce',style: TextStyle(color: Colors.white),)),
                                 )

                                     : Padding(padding: EdgeInsets.only(),
                                   child: Container(height: 5.h,width: 22.w,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border:Border.all(width: 1,color: Color(0xffd80605)), ),
                                     child: Center(child: Text('Souce',style: TextStyle(color : Color(0xffd80605),)),
                                     ),
                                   ),
                                 )
                             ),
                             GestureDetector(onTap: (){
                               setState(() {
                                 isSelected4 = !isSelected4;
                               });
                             },
                                 child: isSelected4
                                     ?Container(
                                   height: 5.h,
                                   width: 22.w,
                                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color:Color(0xffd80605)),
                                   child: Center(child: Text('Tomato',style: TextStyle(color: Colors.white),)),
                                 )

                                     : Padding(padding: EdgeInsets.only(),
                                   child: Container(height: 5.h,width: 22.w,
                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),border:Border.all(width: 1,color: Color(0xffd80605)), ),
                                     child: Center(child: Text('Tomato',style: TextStyle(color : Color(0xffd80605),)),
                                     ),
                                   ),
                                 )
                             ),
                           ],
                         ),
                          SizedBox(  height: 3.h,),
                          Row(
                            children: [

                              RatingBar.builder(
                                itemSize: 3.5.h,
                               // initialRating: 5,
                                minRating: 1,
                                direction: Axis.horizontal,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding:
                                    const EdgeInsets.symmetric(horizontal: 1.0),
                                itemBuilder: (context, _) => const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                onRatingUpdate: (value) {
                                  setState(() {
                                    fullRating = value;
                                  });
                                },
                              ),
                              Text("$fullRating"),
                              SizedBox(width: 25.w,),
                              const Icon(Icons.watch_later_outlined),
                              const Text("10-15 min"),
                            ],
                          ),
                          SizedBox(height: 5.h,),
                          GestureDetector(onTap: (){
                            Navigator.of(context).pop();
                          },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 35),
                              child: Container(
                                height:6.5.h,width: 75.w,
                                child: Center(child: Text("ADD TO CART",style: TextStyle(fontSize: 2.3.h,color: Colors.white,fontWeight: FontWeight.bold),)),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: const Color(0xffd80605),),),
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                  top: 22.h,
                  left: 3.4.h,
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 14.5.h,backgroundImage: AssetImage(widget.model!.image!),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 9.6.h, top: 5.h),
                        height: 11.5.h,
                        width: 10.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xffffffff),
                          boxShadow: [BoxShadow(color: Colors.grey.shade300,blurRadius: 3,spreadRadius: 0.5)]
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  increment();
                                },
                                child: Icon(Icons.add)),
                            Text(
                              _count.toString(),
                              style: TextStyle(fontSize: 3.h),
                            ),
                            GestureDetector(
                                onTap: () {
                                  decrement();
                                },
                                child: Icon(Icons.remove)),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

