import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:footware/features/Authentication/signup.dart';
import 'package:footware/widget/button.dart';
import 'package:footware/widget/inputfield.dart';

import '../../widget/iconbadge.dart';
import '../../widget/navigationbar.dart';



class LogInPage extends StatefulWidget {
  const LogInPage({super.key});

  @override
  State<LogInPage> createState() => _LogInPageState();
}

class _LogInPageState extends State<LogInPage> {
  bool isClicked = false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   emailController.text = "test@gmail.com";
  //   passwordController.text = "123456";
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
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
              CustomInputField(
                controller: emailController,
                textOfField: "Email",
                obscure: false,
                prefixIcon: Icon(Icons.mail),
              ),
              SizedBox(height: 20),

              CustomInputField(
                controller: passwordController,
                textOfField: "Password",
                obscure: true,
                prefixIcon: Icon(Icons.lock),
                suffixIcon: Icon(Icons.remove_red_eye_sharp),
              ),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Checkbox(
                      value: isClicked,
                      onChanged: (value) {
                        setState(() {
                          isClicked = value ?? false;
                        });
                      },
                    ),
                    SizedBox(width: 2),
                    Text(
                      "Remember me",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              CustomButton(
                title: "Sign in",
                onTap: () {
                  if (emailController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Enter Email & Password")),
                    );
                    return;
                  }
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
                    CustomSvgButton(svgLocation: "assets/facebook.svg"),
                    CustomSvgButton(svgLocation: "assets/google.svg"),
                    CustomSvgButton(svgLocation: "assets/apple.svg"),
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
