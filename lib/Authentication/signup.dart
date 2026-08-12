import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:footware/Authentication/loginpage.dart';
import 'package:footware/widget/button.dart';
import 'package:footware/widget/inputfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 120, 20, 0),
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
              "Create Your Account ",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            CustomInputField(textOfField: "Name",
              obscure: false,
              prefixIconData: Icons.person,),
            SizedBox(height: 20),

            CustomInputField(textOfField: "Phone No",
              obscure: false,
              prefixIconData: Icons.phone,),
            SizedBox(height: 20),
            CustomInputField(textOfField: "Email",
              obscure: false,
              prefixIconData: Icons.email,),
            SizedBox(height: 20),

            CustomInputField(textOfField: "Password",
              obscure: true,
              prefixIconData: Icons.lock,
              suffixIconData: Icons.remove_red_eye_sharp,),
            SizedBox(height: 15),

            SizedBox(height: 20),
            CustomButton(
              title: "Sign up",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogInPage()),
                );
              },
            ),
            SizedBox(height: 30),
            RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.grey),
                text: "Already have an account?  ",
                children: [
                  TextSpan(
                    text: "Sign in",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogInPage()),
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
    );
  }
}
