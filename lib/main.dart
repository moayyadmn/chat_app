import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/services/app_services.dart';
import 'package:scholarchat_app/core/utils/bloc_providers.dart';
import 'package:scholarchat_app/core/simple_bloc_observer.dart';
import 'package:scholarchat_app/core/utils/theme/theme_controller.dart';
import 'core/helper/app_screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  runApp(const MyApp());
  Bloc.observer = SimpleBlocObserver();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    return MultiBlocProvider(
      providers: MyProviders.providers,
      child: GetBuilder<ThemeController>(
        builder: (controller) {
          return GetMaterialApp(
            title: 'ChatBox',
            theme: controller.appTheme,
            getPages: routeList,
          );
        },
      ),
    );
  }
}
