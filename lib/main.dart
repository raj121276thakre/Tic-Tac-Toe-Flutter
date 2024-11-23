import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:tik_tac_toe_multiplayer/Configs/PageRoute.dart';
import 'package:tik_tac_toe_multiplayer/Configs/Theme.dart';
import 'package:tik_tac_toe_multiplayer/Pages/SplashPage/SplashPage.dart';
import 'package:tik_tac_toe_multiplayer/firebase_options.dart';

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
    return GetMaterialApp(
      getPages: pages,
      debugShowCheckedModeBanner: false,
      title: 'Tik Tac Toe MultiPlayer',
      theme: lightTheme,
      home: const SplashPage(),
    );
  }
}
