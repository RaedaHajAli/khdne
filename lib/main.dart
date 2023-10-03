import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:khdne/controller/init_controller.dart';
import 'package:khdne/views/add_vehicle.dart';
import 'package:khdne/views/login_screen.dart';


import 'package:khdne/views/register_screen.dart';

void main() {
  initController();
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home:RegisterScreen()
    );
  }
}
