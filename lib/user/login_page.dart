import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sizer/sizer.dart';
import 'package:ui/Screen/first_page.dart';
import 'package:ui/user/sign_up.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  // if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
  //   return "Please enter a valid email address";
  // }
  final formkey = GlobalKey<FormState>();
  String? email;
  String? password;
  login() async {
    try {
      final firebaseauth = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: passController.text,
      );
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FirstPage(),
          ));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        // print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text(
              "No user found for that email.",
              style: TextStyle(fontSize: 13.sp),
            )));
      } else if (e.code == 'wrong-password') {
        // print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
              content: Text(
                'Wrong password provided for that user.',
                style: TextStyle(fontSize: 13.sp),
              )),
        );
      }
    }
  }
  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );



    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }


  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }



  @override

  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Column(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(top: 50, left: 20),
                height: 10.h,
                width: 20.w,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://business.ucr.edu/sites/default/files/styles/form_preview/public/icon-individual.png?itok=aVmhlPs5"),
                        fit: BoxFit.cover)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    labelText: 'Email',
                    hintText: 'Enter Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: passController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    )),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 8.h,
                width: 100.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(9),
                    color: Color(0xff03087b).withOpacity(0.3)),
                child: Center(
                  child: GestureDetector(
                      onTap: () {
                         login();
                      },
                      child: Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Color(0xff03087b),
                        ),
                      )),
                ),
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Need an account?',
                  style:
                      TextStyle(fontSize: 10.sp, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SignUp(),
                          ));
                    },
                    child: Text(
                      ' Sign Up',
                      style: TextStyle(
                          color: Color(0xff03087b),
                          fontSize: 11.sp,
                          fontWeight: FontWeight.bold),
                    )),
              ],
            ),
            SizedBox(height: 2.h,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(onTap: (){
                    signInWithFacebook();
                },
                  child: Container(
                    height: 7.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/facebook.png'))),
                  ),
                ),
                GestureDetector(onTap: (){
                  signInWithGoogle();
                  setState(() {

                  });
                },
                  child: Container(
                    height: 7.h,
                    width: 6.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/google.png'),)),
                  ),
                )
              ],
            ),


          ],
        ),
      ),
    );
  }
}
