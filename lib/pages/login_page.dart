// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cotani_new/components/button.dart';
import 'package:cotani_new/components/text_field.dart';

class LoginPage extends StatefulWidget {
  final Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Text Editing Controller
  final emailTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  // Log user in
  void logIn() async {
    // Show loading circle
    showDialog(
      context: context, 
      builder: (context) => const Center(child: CircularProgressIndicator(),
      ),
    );

    // Try log in
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailTextController.text,
        password: passwordTextController.text,
      );

      // Pop loading circle
      if (context.mounted) Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      // Pop loading circle
      Navigator.pop(context);
      // Display error message
      displayMessage(e.code);
    }
  }

  // Display a dialog message
  void displayMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo
                const Icon(
                  Icons.lock,
                  size: 100,
                ),
            
                const SizedBox(height: 50),
            
                //Hello! Welcome back.
                Text(
                  "Hello!",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                  ),
                ),

                Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.grey[700],
                    fontSize: 24,
                  ),
                ),
            
                const SizedBox(height: 25),
            
                // Email Textfield
                MyTextField(
                  controller: emailTextController, 
                  hintText: 'Email', 
                  obscureText: false,
                ),

                const SizedBox(height: 25),
            
                // Password Textfield
                MyTextField(
                  controller: passwordTextController, 
                  hintText: 'Password', 
                  obscureText: true,
                ),

                const SizedBox(height: 25),
            
                // Login Button
                MyButton(
                  onTap: logIn, 
                  text: 'LOG IN'
                ),
            
                // Google Login Button

                const SizedBox(height: 15),
            
                // Register Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account?",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                    const SizedBox(width: 4),
                    GestureDetector(
                      onTap: widget.onTap,
                      child: const Text(
                        "Sign up",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      "now",
                      style: TextStyle(
                        color: Colors.grey[700],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}