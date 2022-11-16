import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui/Screen/second_page.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';


class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SingleChildScrollView(
       child: Container(
         height: 200.h,
         width: 200.w,
         decoration: BoxDecoration(
           image: DecorationImage(image: AssetImage("assets/f1.jpeg"),fit:BoxFit.fill)
         ),
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Text('Food Go!',style: GoogleFonts.acme(fontStyle: FontStyle.italic,fontSize: 8.h,color: Colors.white),),
              Text('Get your favorite food from here',style: TextStyle(fontSize: 2.h,fontWeight: FontWeight.bold,color: Colors.white54),),
              SizedBox(height: 60.h,),
              Container(
                height: 8.h,
                width: 17.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xfffc1d1c),
                ),
                child:Center(child: GestureDetector(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SecondPage(),));
                },
                    child: Icon(Icons.chevron_right,color: Colors.white,size: 8.h,)),),
               
              ),
            ],
          ),
        ),

       ),
     ),
    );
  }
}
