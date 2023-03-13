// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/widgets/text_filed_widget.dart';

class LogInScreen extends StatelessWidget {
  LogInScreen({super.key});
  String? email;
  String? password;
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          scrollDirection: Axis.vertical,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(flex: 1),
                  const Text(
                    textAlign: TextAlign.start,
                    'Login Now',
                    style: TextStyle(
                      color: Color(0xff645ce6),
                      fontSize: 40,
                      fontFamily: 'Title',
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Text(
                    'Please login to continue using our app',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/login.png',
                        width: 300,
                        height: 300,
                      ),
                    ],
                  ),
                  TextFieldWidget(
                    onChanged: (data) {
                      email = data;
                    },
                    onValid: (text) {
                      if (text!.isEmpty) {
                        return 'wrong email';
                      }
                      return null;
                    },
                    hintText: 'Email',
                    icon: const Icon(
                      Icons.email,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFieldWidget(
                    obscureText: true,
                    onChanged: (data) {
                      password = data;
                    },
                    onValid: (text) {
                      if (text!.length <= 4) {
                        return 'password must be more than 4 letters';
                      }
                      return null;
                    },
                    hintText: 'Password',
                    icon: const Icon(
                      Icons.lock,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  GestureDetector(
                    onTap: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return const Center(
                                    child: CircularProgressIndicator(
                                  color: Color(0xff645ce6),
                                ));
                              });
                          final loginCredential = await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
                            email: email!,
                            password: password!,
                          );
                          Navigator.of(context).pushReplacementNamed(
                              'chatScreen',
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('No user found for that email.'),
                              ),
                            );
                          } else if (e.code == 'wrong-password') {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Wrong password provided for that user.'),
                              ),
                            );
                          }
                        } catch (ex) {
                          Navigator.of(context).pop();
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('an error has occurred'),
                            ),
                          );
                        }
                      }
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: const Color(0xff645ce6),
                      ),
                      width: double.infinity,
                      height: 50,
                      child: const Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed('signUpScreen');
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                                color: Color(0xff645ce6),
                                fontWeight: FontWeight.bold),
                          )),
                    ],
                  ),
                  const Spacer(flex: 2),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
