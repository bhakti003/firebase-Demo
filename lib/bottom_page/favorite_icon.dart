import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class FavoriteIcon extends StatefulWidget {
  const FavoriteIcon({Key? key}) : super(key: key);

  @override
  State<FavoriteIcon> createState() => _FavoriteIconState();
}

class _FavoriteIconState extends State<FavoriteIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: (){
        Navigator.pop(context);
      },
        child: Container(
          height: 20.h,
          width: 200.w,
          color: Colors.blue,
          child:Text('FavriteIcon'),
        ),
      ),
    );
  }
}
