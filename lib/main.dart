import 'package:aserar_admin/controller/api_controller.dart';
import 'package:aserar_admin/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xfff2f2f2),
    statusBarIconBrightness: Brightness.dark, // status bar color
  ));
  Get.put<ApiController>(ApiController());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aserar Admin',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xfff2f2f2),
        primarySwatch: Colors.teal,
      ),
      home: Home(),
    );
  }
}
