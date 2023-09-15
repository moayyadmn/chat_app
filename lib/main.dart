import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/theme/app_theme.dart';
import 'package:scholarchat_app/features/chat/data/chat_cubit/chat_cubit.dart';
import 'package:scholarchat_app/features/community/data/fetch_user_cubit/fetch_user_cubit.dart';
import 'package:scholarchat_app/features/login/data/login_cubit/login_cubit.dart';
import 'package:scholarchat_app/core/simple_bloc_observer.dart';
import 'core/blocs/app_root_bloc/app_root_bloc.dart';
import 'core/blocs/app_root_bloc/app_root_event.dart';
import 'core/helper/app_screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
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
          create: (context) => FetchUserCubit()..fetchUsers(),
        ),
        BlocProvider(
          create: (context) => AppRootBloc()..add(AppRootEvent()),
        ),
      ],
      child: GetMaterialApp(
        title: 'ChatBox',
        theme: AppTheme.themeData(false, context),
        home: isLogged(),
        getPages: routeList,
      ),
    );
  }
}
