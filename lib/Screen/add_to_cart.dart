import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';

class AddToCart extends StatefulWidget {
  const AddToCart({Key? key}) : super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  TextEditingController serachcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
        SingleChildScrollView(
        child: SafeArea(
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
                          openDrawer();
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
                TabBar(
                  // controller: tabController,
                  indicatorColor: Color(0xffd80605),
                  unselectedLabelColor: Colors.black38,
                  labelColor: Color(0xffd80605),
                  tabs: [
                    Tab(
                      child: Text(
                        'Foods',
                        style: TextStyle(
                          fontSize: 2.4.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Drinks',
                        style: TextStyle(
                          fontSize: 2.4.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Snack',
                        style: TextStyle(
                          fontSize: 2.4.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Sauce',
                        style: TextStyle(
                          fontSize: 2.4.h,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  child: TabBarView(
                    // controller: tabController,
                    children: [
                      Text('dj'),
                      Text('sss'),
                      Text("syd"),
                      Text("sdhsds"),
                    ],
                  ),
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
                  height: 5.h,
                ),
                Container(
                  height: 40.h,
                   // color: Colors.red,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                    itemCount: 10,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(onTap: (){
                          //  Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(
                          //   // model: foodList[index],
                          // ),));
                          setState(() {});
                        },
                          child: Stack(children: [
                            Padding(
                              padding: const EdgeInsets.only(top:70),
                              child: Container(
                                height: 27.h,
                                width: 42.w,
                               decoration: BoxDecoration(
                                 borderRadius: BorderRadius.circular(30),
                                 color: Colors.white,
                               ),

                                child:  Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 10.h,),
                                    // Center(child: Text(foodList[index].name!,style: TextStyle(color: Colors.black,fontSize: 21,),textAlign: TextAlign.center,)),
                                    // Text('${foodList[index].prices!}.00',style: TextStyle(color: Colors.red,fontSize: 20),),
                                      Text("sdfsdf",style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
                                      Text("asdasd",style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),
                                    Text("sadfsaf",style: TextStyle(color: Colors.black,fontSize: 17,),textAlign: TextAlign.center,),


                                  ],
                                ),
                              ),
                            ),
                            Positioned(top: 2.sp,left: 16.5.sp,
                                child: CircleAvatar(radius: 8.h,
                                   // backgroundImage: FileImage(File(data[index].image.toString())),
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void openDrawer() {}
}
