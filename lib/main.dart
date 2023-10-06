import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/utils/bloc_providers.dart';
import 'package:scholarchat_app/core/utils/service_locator.dart';
import 'package:scholarchat_app/core/utils/theme/app_theme.dart';
import 'package:scholarchat_app/core/simple_bloc_observer.dart';
import 'core/helper/app_screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  setup();
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: MyProviders.providers,
      child: GetMaterialApp(
        title: 'ChatBox',
        theme: AppTheme.themeData(isDarkTheme: false),
        home: isLogged(),
        getPages: routeList,
      ),
    );
  }
}
