// ignore_for_file: use_build_context_synchronously, prefer_const_constructors

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper_app/admin/add_wallpaper.dart';
import 'package:wallpaper_app/widget/snackbar.dart';
import 'package:wallpaper_app/widget/text_field.dart';
import 'package:wallpaper_app/lodin/register.dart';
import 'package:wallpaper_app/service/authentication.dart';
import 'package:wallpaper_app/widget/button.dart';
import 'package:wallpaper_app/pages/bottomnav.dart';
import 'package:wallpaper_app/password_forget/forgot_password.dart';
import 'package:wallpaper_app/login_with_google/google_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool _isPasswordVisible = false;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void loginUser() async {
  setState(() {
    isLoading = true;
  });

  String res = await AuthMethod().loginUser(
    email: emailController.text,
    password: passwordController.text,
  );

  if (res == "success") {
    // Check user type
    FirebaseFirestore.instance
        .collection('users')
        .where('email', isEqualTo: emailController.text)
        .get()
        .then((querySnapshot) {
      if (querySnapshot.docs.isNotEmpty) {
        var userDoc = querySnapshot.docs.first;
        bool isAdmin = userDoc.data()['isAdmin'] ?? false;

        // Navigate to the appropriate page based on user type
        if (isAdmin) {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const AddWallpaper(),
            ),
          );
        } else {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => const BottomNav(),
            ),
          );
        }
      } else {
        // User not found
        setState(() {
          isLoading = false;
        });
        showSnackBar(context, 'User not found');
      }
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      showSnackBar(context, 'Error fetching user data: $error');
    });
  } else {
    setState(() {
      isLoading = false;
    });
    showSnackBar(context, res);
  }
}


  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height / 2.7,
                  child: Image.asset('assets/img/login.jpg'),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldInput(
                        icon: Icons.person,
                        textEditingController: emailController,
                        hintText: 'Enter your email',
                        textInputType: TextInputType.emailAddress,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        child: TextFormField(
                          style: const TextStyle(fontSize: 20, fontFamily: 'Poppins'),
                          controller: passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please Enter Password";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.lock, color: Colors.black54),
                            hintText: 'Enter your password',
                            hintStyle: const TextStyle(color: Colors.black45, fontSize: 18),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            border: InputBorder.none,
                            focusedBorder: OutlineInputBorder(
                              borderSide: const BorderSide(color: Colors.blue, width: 2),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor: const Color(0xFFedf0f8),
                            contentPadding: const EdgeInsets.symmetric(
                              vertical: 15,
                              horizontal: 20,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                                color: Colors.black54,
                              ),
                              onPressed: () {
                                setState(() {
                                  _isPasswordVisible = !_isPasswordVisible;
                                });
                              },
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: !_isPasswordVisible,
                        ),
                      ),
                    ],
                  ),
                ),
                const ForgotPassword(),
                MyButtons(
                  onTap: () {
                    if (_formKey.currentState!.validate()) {
                      loginUser();
                    }
                  },
                  text: "Log In",
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 15.0),
                        height: 1,
                        color: Colors.black26,
                      ),
                    ),
                    const Text(
                      "  OR  ",
                      style: TextStyle(fontFamily: 'Poppins', fontSize: 18),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 18.0),
                        height: 1,
                        color: Colors.black26,
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurple),
                    onPressed: () async {
                      await FirebaseServices().signInWithGoogle();
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const BottomNav(),
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 8, horizontal: 15),
                          child: Image.network(
                            "https://cdn1.iconfinder.com/data/icons/google-s-logo/150/Google_Icons-09-512.png",
                            height: 35,
                          ),
                        ),
                        const SizedBox(width: 2),
                        const Text(
                          "Continue with Google",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white,
                            fontFamily: 'Poppins',
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account? ",
                        style: TextStyle(fontFamily: 'Poppins'),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const SignupScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          "SignUp",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 15.0),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
