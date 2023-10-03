import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';
import 'package:khdne/views/add_vehicle/components/app_bar.dart';
import 'package:khdne/views/add_vehicle/components/build_add_vehicle_body.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: buildAppBar(),
      body: AddVehicleBody(),
    );
  }

 
}
