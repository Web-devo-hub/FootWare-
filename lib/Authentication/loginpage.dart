import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footware/Authentication/signup.dart';
import 'package:footware/widget/button.dart';
import 'package:footware/widget/inputfield.dart';
import 'package:footware/homepage.dart';

import '../widget/iconbadge.dart';
import '../widget/navigationbar.dart';

class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 100, 20, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: AlignmentGeometry.topCenter,
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.red,
                    image: DecorationImage(
                      image: AssetImage("assets/images.jpeg"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Login to Your Account ",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 50),
              CustomInputField(textOfField: "Email",
                obscure: false,
                prefixIconData: Icons.mail,),
              SizedBox(height: 20),
        
              CustomInputField(textOfField: "Password",
                obscure: true,
                prefixIconData: Icons.lock,
                suffixIconData: Icons.remove_red_eye_sharp,),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 3),
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(width: 13),
                    Text(
                      "Remember me",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Sign in",
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => KNavigationBar()),
                  );
                },
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  "Forgot the Password?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: Divider(
                      thickness: 0.5,
                      height: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(width: 7),
                  Text(
                    "or continue with",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.grey[500],
                    ),
                  ),
                  SizedBox(width: 7),
        
                  SizedBox(
                    width: 70,
                    child: Divider(
                      thickness: 0.5,
                      height: 50,
                      color: Colors.grey[400],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    CustomSvgButton(svgLocation: "assets/facebook.svg",),
                    CustomSvgButton(svgLocation: "assets/google.svg",),
                    CustomSvgButton(svgLocation: "assets/apple.svg",),
                  ],
                ),
              ),
              SizedBox(height: 30),
        
              RichText(
                text: TextSpan(
                  style: TextStyle(color: Colors.grey),
                  text: "Don't have an account?  ",
                  children: [
                    TextSpan(
                      text: "Sign up",
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => SignUp()),
                          ); //add signup route here
                        },
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//Container(
//                     width: 80,
//                     height: 60,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       border: Border.all(width: 0.5, color: Colors.grey),
//                     ),
//                     child: IconButton(
//                       onPressed: () {},
//                       icon: FaIcon(
//                         FontAwesomeIcons.facebook,
//                         color: Color(0xff1877F2),
//                       ),
//                     ),
//                   ),
