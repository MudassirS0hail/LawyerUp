import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iec_project/controllers/auth_controller.dart';
import 'package:iec_project/pages/introduction.dart';

import 'package:iec_project/pages/job_seekers.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) => Get.put(Authcontroller()));
  await GetStorage.init();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color.fromARGB(255, 19, 35, 43), // Status bar color
    ));

    return GetMaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const IntroductionScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

bool isFirstTime() {
  bool? firstTime = GetStorage().read('first_time');

  if (firstTime == null || !firstTime) {
    return true;
  } else {
    GetStorage().write('first_time', false);
    return false;
  }
}
