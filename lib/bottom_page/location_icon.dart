import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LocationIcon extends StatefulWidget {
  const LocationIcon({Key? key}) : super(key: key);

  @override
  State<LocationIcon> createState() => _LocationIconState();
}

class _LocationIconState extends State<LocationIcon> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(onTap: (){
        Navigator.pop(context);
      },
        child: Container(
          height: 20.h,
          width: 200.w,
          color: Colors.yellow,
          child:Text('Locationscreen'),
        ),
      ),
    );
  }
}
