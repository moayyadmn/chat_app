import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/animation.dart';

const String kLoginRoute = '/loginScreen';
const String kSignUpRoute = 'signUpScreen';
const String kChatRoute = '/chatScreen';
const String kUserChatRoute = '/userChatScreen';
const String kChatListRoute = '/chatListScreen';
const Color kMainColor = Color(0xff645ce6);

//firebase
User? currentUser = FirebaseAuth.instance.currentUser;
