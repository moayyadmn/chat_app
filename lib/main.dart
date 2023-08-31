import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/constants.dart';
import 'package:scholarchat_app/cubits/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/cubits/login_cubit/login_cubit.dart';
import 'package:scholarchat_app/screens/root_screen.dart';
import 'package:scholarchat_app/screens/welcome_screen.dart';
import 'package:scholarchat_app/simple_bloc_observer.dart';
import 'core/blocs/app_root_bloc/app_root_bloc.dart';
import 'core/blocs/app_root_bloc/app_root_event.dart';
import 'core/helper/app_screens.dart';
import 'firebase_options.dart';

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
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => ChatCubit(),
        ),
        BlocProvider(
          create: (context) => AppRootBloc()..add(AppRootEvent()),
        ),
      ],
      child: GetMaterialApp(
        title: 'EChat',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(color: kMainColor),
          primarySwatch: Colors.blue,
        ),
        home: isLogged == false ? const WelcomeScreen() : const RootScreen(),
        getPages: routeList,
      ),
    );
  }
}
