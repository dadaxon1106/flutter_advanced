import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/screens/home_screen.dart';
import 'package:flutter_advance/screens/login_screen.dart';
import 'package:flutter_advance/services/auth_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  var isLoading = false;
  var fullnameController = TextEditingController();
  var email = TextEditingController();
  var password = TextEditingController();
  var cpassword = TextEditingController();

  _doSignUp() {
    String name = fullnameController.text.trim();
    String getEmail = email.text.trim();
    String getPassword = password.text.trim();
    String conpassword = cpassword.text.trim();
    if (name.isEmpty ||
        getEmail.isEmpty ||
        getPassword.isEmpty ||
        conpassword.isEmpty) return;

    if (getPassword != conpassword) return;

    AuthService.signUpUser(name, getEmail, getPassword)
        .then((value) => {responseSignUp(value!)});
  }

  void responseSignUp(User firebaseUser) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => const HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    final portaitorLands = MediaQuery.of(context).orientation;

    return Scaffold(
      body: portaitorLands == Orientation.portrait
          ? Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    Color.fromRGBO(193, 53, 132, 1),
                    Color.fromRGBO(131, 58, 180, 1)
                  ])),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //# fullname
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: fullnameController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "FullName",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),

                        //# email
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),
//# password
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: password,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),

                        //# cpassword
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: cpassword,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),

                        //#signup
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _doSignUp,
                          child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: double.maxFinite,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white54.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        const TextSpan(
                          text: "Don't have an account?",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                            text: "Sign In",
                            style: const TextStyle(
                              color: Colors.blue,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const LoginScreen()));
                              })
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            )
          : SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                      Color.fromRGBO(193, 53, 132, 1),
                      Color.fromRGBO(131, 58, 180, 1)
                    ])),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //# fullname
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: fullnameController,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "FullName",
                              hintStyle: TextStyle(
                                color: Colors.white54,
                              ),
                            ),
                          ),
                        ),

                        //# email
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: email,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Email",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),
                        //# password
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: password,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),

                        //# cpassword
                        const SizedBox(height: 20),
                        Container(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          width: double.maxFinite,
                          height: 50,
                          decoration: BoxDecoration(
                            color: Colors.white54.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: TextField(
                            controller: cpassword,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                            decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: "Confirm Password",
                                hintStyle: TextStyle(
                                  color: Colors.white54,
                                )),
                          ),
                        ),

                        //#signup
                        const SizedBox(height: 20),
                        GestureDetector(
                          onTap: _doSignUp,
                          child: Container(
                              padding:
                                  const EdgeInsets.only(left: 10, right: 10),
                              width: double.maxFinite,
                              height: 50,
                              decoration: BoxDecoration(
                                color: Colors.white54.withOpacity(0.4),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18),
                                ),
                              )),
                        ),
                      ],
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          const TextSpan(
                            text: "Don't have an account?",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          TextSpan(
                              text: "Sign In",
                              style: const TextStyle(
                                color: Colors.blue,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) => const LoginScreen()));
                                })
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ),
    );
  }
}
