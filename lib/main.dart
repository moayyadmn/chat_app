import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/cubits/signup_cubit/signup_cubit.dart';
import 'package:scholarchat_app/cubits/login_cubit/login_cubit.dart';
import 'package:scholarchat_app/screens/signup_screen.dart';
import 'package:scholarchat_app/screens/user_chat_screen.dart';
import 'package:scholarchat_app/screens/welcome_screen.dart';
import 'firebase_options.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginCubit()),
        BlocProvider(
          create: (context) => SignupCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
      ],
      child: MaterialApp(
        title: 'ScholarChat',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kMainColor),
          primarySwatch: Colors.blue,
        ),
        home: const WelcomeScreen(),
        routes: {
          kLoginRoute: (context) => LogInScreen(),
          kSignUpRoute: (context) => SignUpScreen(),
          kChatRoute: (context) => ChatScreen(),
          kUserChatRoute: ((context) => const UserChatScreen())
        },
      ),
    );
  }
}
