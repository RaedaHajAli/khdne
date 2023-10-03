import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/controller/app_controller.dart';
import 'package:khdne/controller/init_controller.dart';
import 'package:khdne/models/color_manager.dart';
import 'package:khdne/models/images_manager.dart';
import 'package:khdne/models/vehicle_model.dart';
import 'package:khdne/views/componants/custom_button.dart';
import 'package:khdne/views/componants/custom_dropdown_button.dart';
import 'package:khdne/views/componants/custom_text_field.dart';
import 'package:khdne/views/componants/vehicle_image.dart';

class AddVehicle extends StatefulWidget {
  const AddVehicle({super.key});

  @override
  State<AddVehicle> createState() => _AddVehicleState();
}

class _AddVehicleState extends State<AddVehicle> {
  String vehicleType = '1';
  String vehicleColor = 'Black';
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  TextEditingController vehicleModelController = TextEditingController();

  TextEditingController vehicleNumberController = TextEditingController();
  File? mechanicImage;
  File? vehicleImage;
  File? boardImage;
  File? idImage;
  File? delegateImage;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: ColorManager.white,
        title: const Text(
          'إضافة مركبة',
          style: TextStyle(
              color: ColorManager.blue,
              fontSize: 20,
              fontWeight: FontWeight.w500,
              fontFamily: kSomarFont),
        ),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: ColorManager.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: const Offset(1.0, 1.0),
                  ),
                  BoxShadow(
                    color: Colors.grey.shade100,
                    blurRadius: 3.0,
                    spreadRadius: 3.0,
                    offset: const Offset(-1.0, -1.0),
                  )
                ],
              ),
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 18,
                  color: ColorManager.blue,
                ),
                onPressed: () {},
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomDropDownButton(
                    value: vehicleType,
                    image: ImagesManager.vehicleTypeImage,
                    title: 'نوع المركبة',
                    items: const [
                      DropdownMenuItem<String>(
                        value: '1',
                        child: Text('Marcedes'),
                      ),
                      DropdownMenuItem(
                        value: '2',
                        child: Text(
                          'BMW',
                        ),
                      ),
                      DropdownMenuItem(
                        value: '3',
                        child: Text(
                          'Ford',
                        ),
                      ),
                      DropdownMenuItem(
                        value: '4',
                        child: Text('Hyundai'),
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        vehicleType = value as String;
                        print(value);
                      });
                    },
                  ),
                  CustomTextFormField(
                    label: 'الموديل',
                    prefixIcon: Image.asset(
                      ImagesManager.vehicleModelImage,
                    ),
                    controller: vehicleModelController,
                    type: TextInputType.name,
                  ),
                  CustomDropDownButton(
                    image: ImagesManager.vehicleColorImage,
                    title: 'لون المركبة',
                    items: const [
                      'Black',
                      'Red',
                      'White',
                      'Blue',
                      'Grey',
                    ]
                        .map((e) => DropdownMenuItem(
                              value: e,
                              child: Text(e),
                            ))
                        .toList(),
                    value: vehicleColor,
                    onChanged: (value) {
                      setState(() {
                        vehicleColor = value as String;
                      });
                    },
                  ),
                  CustomTextFormField(
                    label: 'رقم اللوحة',
                    prefixIcon: Image.asset(
                      ImagesManager.vehicleNumberImage,
                    ),
                    controller: vehicleNumberController,
                    type: TextInputType.number,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text(
                    'صور المركبة',
                    style: TextStyle(
                        color: ColorManager.blue,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        fontFamily: kSomarFont),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: const Text(
                      '1- صورة الميكانيك',
                      style: TextStyle(
                          color: ColorManager.greyBold,
                          fontSize: 12,
                          fontFamily: kSomarFont),
                    ),
                    onTap: () async {
                      await controller
                          .getImage(image: mechanicImage)
                          .then((value) {
                        if (value != null) {
                          mechanicImage = value;
                          controller.addMechanicImage(image: value);
                        }
                      });
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      '2-صورة المركبة',
                      style: TextStyle(
                          color: ColorManager.greyBold,
                          fontSize: 12,
                          fontFamily: kSomarFont),
                    ),
                    onTap: () async {
                      await controller
                          .getImage(image: vehicleImage)
                          .then((value) {
                        if (value != null) {
                          vehicleImage = value;
                          controller.addVehicleImage(image: value);
                        }
                      });
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      '3- صورة اللوحة',
                      style: TextStyle(
                          color: ColorManager.greyBold,
                          fontSize: 12,
                          fontFamily: kSomarFont),
                    ),
                    onTap: () async {
                      await controller
                          .getImage(image: boardImage)
                          .then((value) {
                        if (value != null) {
                          boardImage = value;
                          controller.addBoardImage(image: value);
                        }
                      });
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      '4- الهوية الشخصية',
                      style: TextStyle(
                          color: ColorManager.greyBold,
                          fontSize: 12,
                          fontFamily: kSomarFont),
                    ),
                    onTap: () async {
                      await controller.getImage(image: idImage).then((value) {
                        if (value != null) {
                          idImage = value;
                          controller.addIdImage(image: value);
                        }
                      });
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  InkWell(
                    child: const Text(
                      '5- الوكالة أو التفويض',
                      style: TextStyle(
                          color: ColorManager.greyBold,
                          fontSize: 12,
                          fontFamily: kSomarFont),
                    ),
                    onTap: () async {
                      await controller
                          .getImage(image: delegateImage)
                          .then((value) {
                        if (value != null) {
                          delegateImage = value;
                          controller.addDelegateImage(image: value);
                        }
                      });
                      setState(() {});
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  controller.imagesMap.values.isNotEmpty
                      ? GetBuilder<AppController>(builder: (_) {
                          return SizedBox(
                            height: 200,
                            child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: ListView.separated(
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (context, index) {
                                  return VehicleImage(
                                      image: controller.imagesMap.values
                                          .toList()[index]);
                                },
                                separatorBuilder: (context, index) =>
                                    const SizedBox(
                                  width: 3,
                                ),
                                itemCount: controller.imagesMap.values.length,
                              ),
                            ),
                          );
                        })
                      : Image.asset(
                          ImagesManager.user,
                          width: 200,
                          height: 200,
                        ),
                  const SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    text: 'إضافة المركبة',
                    onTap: () {
                      if (formKey.currentState!.validate()) {
                        controller.vehicleModel = VehicleModel(
                            vehicleType: vehicleType,
                            vehicleModel: vehicleModelController.text,
                            vehicleColor: vehicleColor,
                            vehicleNumber: vehicleNumberController.text,
                            mechanicImage: mechanicImage!,
                            vehicleImage: vehicleImage!,
                            boardImage: boardImage!,
                            idImage: idImage!,
                            delegateImage: delegateImage!);

                        print('trying....');
                        controller.addNewVehicle(
                            model: controller.vehicleModel!,
                            token: controller.loginModel!.token!);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
