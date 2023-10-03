 import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/controller/app_controller.dart';
import 'package:khdne/controller/init_controller.dart';
import 'package:khdne/models/color_manager.dart';
import 'package:khdne/models/images_manager.dart';
import 'package:khdne/models/vehicle_model.dart';
import 'package:khdne/views/add_vehicle/components/build_images_list.dart';
import 'package:khdne/views/add_vehicle/components/build_no_image_widget.dart';
import 'package:khdne/views/components/custom_button.dart';
import 'package:khdne/views/components/custom_dropdown_button.dart';
import 'package:khdne/views/components/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';


  class AddVehicleBody extends StatefulWidget {
    const AddVehicleBody({super.key});
  
    @override
    State<AddVehicleBody> createState() => _AddVehicleBodyState();
  }
  
  class _AddVehicleBodyState extends State<AddVehicleBody> {
     GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String vehicleType = '1';
  String vehicleColor = 'Black';


  TextEditingController vehicleModelController = TextEditingController();

  TextEditingController vehicleNumberController = TextEditingController();
  File? mechanicImage;
  File? vehicleImage;
  File? boardImage;
  File? idImage;
  File? delegateImage;
    @override
    Widget build(BuildContext context) {
      return GetBuilder<AppController>(builder: (_) {
      return ModalProgressHUD(
        inAsyncCall: controller.addVehiclePross,
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Form(
                key: formKey,
                autovalidateMode: autovalidateMode,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomDropDownButton(
                      value: vehicleType,
                      image: ImagesManager.vehicleTypeImage,
                      title: 'نوع المركبة',
                      items: vehicleTypeList,
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
                      items: vehicleColorList,
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
                            controller.addImage(image: mechanicImage!);
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
                            controller.addImage(image: vehicleImage!);
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
                            controller.addImage(image: boardImage!);
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
                        await controller
                            .getImage(image: idImage)
                            .then((value) {
                          if (value != null) {
                            idImage = value;
                            controller.addImage(image: idImage!);
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
                            controller.addImage(image: delegateImage!);
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
                            return buildImagesList();
                          })
                        : buildNoImageWidget(),
                    const SizedBox(
                      height: 20,
                    ),
                    CustomButton(
                      text: 'إضافة المركبة',
                      onTap: onTapAddVehicle,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
    }
     void onTapAddVehicle() {
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
                          token:
                              '2|KmDHqrfOhJK4kkL7X4JS08ZAtouRM0H9FqPTJ6gFa835f04f'
                          //  controller.loginModel!.token!
                          );
                    } else {
                      autovalidateMode = AutovalidateMode.always;
                      setState(() {});
                    }
                  }
  }
  