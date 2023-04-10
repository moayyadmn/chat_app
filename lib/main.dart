import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/cubits/handle_chat/handle_chat_cubit.dart';
import 'package:scholarchat_app/cubits/login_cubit/login_cubit.dart';
import 'package:scholarchat_app/screens/user_chat_screen.dart';
import 'package:scholarchat_app/screens/welcome_screen.dart';
import 'package:scholarchat_app/simple_bloc_obsorver.dart';
import 'firebase_options.dart';
import 'screens/chat_screen.dart';
import 'screens/login_screen.dart';

bool? isLogged;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  User? user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogged = false;
  } else {
    isLogged = true;
  }
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
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => HandleChatCubit(),
        ),
      ],
      child: GetMaterialApp(
        title: 'ScholarChat',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kMainColor),
          primarySwatch: Colors.blue,
        ),
        home:
            isLogged == false ? const WelcomeScreen() : const UserChatScreen(),
        routes: {
          kLoginRoute: (context) => const LogInScreen(),
          kChatRoute: (context) => const ChatScreen(),
          kUserChatRoute: ((context) => const UserChatScreen())
        },
      ),
    );
  }
}
