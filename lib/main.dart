import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:space_game/controllers/global_bingings.dart';
import 'package:space_game/firebase_options.dart';
import 'package:space_game/widgets/root_wrapper.dart';

void main() async {
  Paint.enableDithering = true;

  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox("config");

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      initialBinding: GlobalBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FlutterEasyLoading(
        child: RootWrapper(),
      ),
    );
  }
}
