import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cosmic_clicker/controllers/global_bingings.dart';
import 'package:cosmic_clicker/firebase_options.dart';
import 'package:cosmic_clicker/widgets/root_wrapper.dart';

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
      title: 'Cosmic Clicker',
      initialBinding: GlobalBindings(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: (context, child) => FlutterEasyLoading(child: child),
      home: const RootWrapper(),
    );
  }
}
