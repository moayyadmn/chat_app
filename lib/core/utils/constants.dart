import 'package:firebase_auth/firebase_auth.dart';

const String kLoginRoute = '/loginScreen';
const String kSignUpRoute = 'signUpScreen';
const String kChatRoute = '/chatScreen';
const String kUserChatRoute = '/userChatScreen';
const String kChatListRoute = '/chatListScreen';
//firebase
User? currentUser = FirebaseAuth.instance.currentUser;
