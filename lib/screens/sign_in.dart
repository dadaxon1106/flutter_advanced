import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advance/screens/auth_screen.dart';
import 'package:flutter_advance/screens/home_page.dart';
import 'package:flutter_advance/services/auth_service.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  void _doSignUp() {
    String email = emailController.text.toString().trim();
    String password = passwordController.text.toString().trim();
    String fullName = nameController.text.toString().trim();
    if (email.isEmpty || password.isEmpty || fullName.isEmpty) return;

    AuthService.signUpUser(fullName, email, password)
        .then((value) => {responseSignUp(value!)});
  }

  void responseSignUp(User firebaseUser) {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (_) => const HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                hintText: "FullName",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: "Email",
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: passwordController,
              decoration: const InputDecoration(hintText: "Password"),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: _doSignUp,
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Text(
                  "Sign Up",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(children: [
                  const TextSpan(
                      text: "Already have an account?",
                      style: TextStyle(
                          fontWeight: FontWeight.w500, color: Colors.black)),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const AuthScreen()));
                      },
                    text: "Sign In",
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  )
                ]),
              ),
            )
          ],
        ),
      ),
    );
  }
}
