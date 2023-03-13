import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/text_filed_widget.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  String? email;
  String? password;
  GlobalKey<FormState> formKey = GlobalKey();
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
                    'Sign Up',
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
                    'Please Registration with email and sign up\n to continue using our app',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/signup.png',
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
                          UserCredential userCredential = await FirebaseAuth
                              .instance
                              .createUserWithEmailAndPassword(
                                  email: email!, password: password!);

                          Navigator.of(context).pushReplacementNamed(
                              'chatScreen',
                              arguments: email);
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'weak-password') {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('weak-password'),
                              ),
                            );
                          } else if (e.code == 'email-already-in-use') {
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('email-already-in-use'),
                              ),
                            );
                          }
                        } catch (e) {
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
                        'Sign up',
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
                        "You already have an account?",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed('loginScreen');
                          },
                          child: const Text(
                            'Login',
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
