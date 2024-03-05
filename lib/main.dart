import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scholarchat_app/core/services/app_services.dart';
import 'package:scholarchat_app/core/utils/bloc_providers.dart';
import 'package:scholarchat_app/core/utils/constants.dart';
import 'package:scholarchat_app/core/utils/theme/app_theme.dart';
import 'package:scholarchat_app/core/simple_bloc_observer.dart';
import 'package:zego_express_engine/zego_express_engine.dart';
import 'core/helper/app_screens.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await initialServices();
  await ZegoExpressEngine.createEngineWithProfile(ZegoEngineProfile(
    appId,
    ZegoScenario.Default,
    appSign: appSign,
  ));
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
        getPages: routeList,
      ),
    );
  }
}
