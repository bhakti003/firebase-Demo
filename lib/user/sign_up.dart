import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/Screen/first_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'login_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController userController = TextEditingController();
  final _formkey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  // String? email;
  // String? uid;
  var usermodel;
  @override
  // void initState() {
  //   _signup();
  //   super.initState();
  // }
  _signup() async {
    try {
      var firebaseAuth = (await _auth.createUserWithEmailAndPassword(
          email: emailController.text, password: passController.text));
       var firebaseUser = firebaseAuth.user;

      if (firebaseUser != null) {
        var user = usermodel(
            email: firebaseUser.email,
            //  password: firebaseUser.email,
            uid: firebaseUser.uid

        );
        // GetStorage().write('user', user.toJson());
        // print(GetStorage().read('user'));
        await FirebaseFirestore.instance
            .collection('Uidemo')
            .doc(firebaseAuth.user!.uid)
            .set(user.toJson());
        // Get.offNamed(Routes.HOME_SCREEN);
      }
    } on FirebaseAuthException catch (e) {
      if(e.code == 'Weak-password'){
        print('The password provided is too weak.');
      }else if(e.code == 'email-already-in use'){
        print('The account already exists for that email.');
      }
      // Get.snackbar('Message', " ${e.message}",
      //     backgroundColor: orange,
      //     isDismissible: true,
      //     duration: Duration(seconds: 3),
    } finally {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Center(
                child: Container(
                    margin: EdgeInsets.only(top: 50, left: 20),
                    height: 10.h,
                    width: 25.w,
                    child: Text('Sign Up', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.sp,
                      color: Color(0xff03087b),),)
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  autofillHints:['name@gmail.com'],
                  controller: emailController,
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Password";
                    } else if (value.length < 6) {
                      return "Password must be atleast 6 characters long";
                    } else if (value != passController.text) {
                      return "Password must be same as above";
                    } else {
                      return null;
                    }
                  },
                  controller: passController,
                  decoration: InputDecoration(
                      prefixIcon: const Icon(Icons.lock),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                ),
              ),
              SizedBox(height: 2.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 8.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(9),
                      color: Color(0xff03087b).withOpacity(0.3)),

                  child: Center(child: GestureDetector(
                      onTap: () {
                        if(_formkey.currentState!.validate()) {
                          _signup();
                          Navigator.push(context, MaterialPageRoute(builder: (
                              context) => FirstPage(),));
                          print("Create New account");
                        }},
                      child: Text('Sign Up', style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.sp,
                        color: Color(0xff03087b),),)),),
                ),
              ),
              SizedBox(height: 2.h,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Allready a User ?', style: TextStyle(
                      fontSize: 10.sp, fontWeight: FontWeight.bold),),

                  GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => LoginPage(),));
                      },
                      child: Text(' Login ', style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Color(0xff03087b),
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
