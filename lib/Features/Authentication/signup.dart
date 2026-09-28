import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:footware/widget/button.dart';
import 'package:footware/widget/inputfield.dart';

import 'loginpage.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController(text: "");
  final TextEditingController phoneNoController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    phoneNoController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
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
              CustomInputField(
                controller: nameController,
                textOfField: "Name",
                obscure: false,
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 20),

              CustomInputField(
                controller: phoneNoController,
                textOfField: "Phone No",
                obscure: false,
                prefixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: 20),
              CustomInputField(
                controller: emailController,
                textOfField: "Email",
                obscure: false,
                prefixIcon: Icon(Icons.email),
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

              SizedBox(height: 20),
              CustomButton(
                title: "Sign up",
                onTap: () {
                  if (nameController.text.trim().isEmpty ||
                      phoneNoController.text.trim().isEmpty ||
                      emailController.text.trim().isEmpty ||
                      passwordController.text.trim().isEmpty) {
                    print("block 1");
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Please enter all fields")),
                    );
                    return;
                  }
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
                            MaterialPageRoute(
                              builder: (context) => LogInPage(),
                            ),
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
