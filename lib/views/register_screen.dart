import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/controller/app_controller.dart';
import 'package:khdne/models/color_manager.dart';
import 'package:khdne/models/images_manager.dart';
import 'package:khdne/views/componants/custom_button.dart';
import 'package:khdne/views/componants/custom_text_field.dart';
import 'package:khdne/views/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
 
  @override
  Widget build(BuildContext context) {
    AppController controller = Get.put(AppController());

    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SizedBox(
          child: Column(
            children: [
              const SizedBox(
                height: 70,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    ImagesManager.khdne_logo,
                    width: 112,
                    height: 49.11,
                  ),
                ],
              ),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Stack(
                  children: [
                    Image.asset(
                      ImagesManager.background,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          const Row(
                            children: [
                              Text(
                                'إنشاء حساب',
                                style: TextStyle(
                                    color: ColorManager.blue,
                                    fontSize: 20,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: kSomarFont),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Form(
                            key: formKey,
                            autovalidateMode: autovalidateMode,
                            child: Column(
                              children: [
                                CustomTextFormFiels(
                                  label: 'الاسم',
                                  icon: Icons.person,
                                  controller: nameController,
                                  type: TextInputType.name,
                                  
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                CustomTextFormFiels(
                                    label: 'رقم الهاتف',
                                    icon: Icons.call,
                                    controller: phoneController,
                                    type: TextInputType.phone),
                                const SizedBox(
                                  height: 20,
                                ),
                                GetBuilder<AppController>(builder: (_) {
                                  return CustomTextFormFiels(
                                    label: 'كلمة السر',
                                    icon: Icons.lock,
                                    obscureText:
                                        controller.passwordRegisterVisibility,
                                    controller: passwordController,
                                    type: TextInputType.visiblePassword,
                                    suffix: IconButton(
                                      icon: Icon(
                                          controller.passwordRegisterVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                      onPressed: () {
                                        controller
                                            .changePasswordRegisterVisibility();
                                      },
                                    ),
                                  );
                                }),
                                const SizedBox(
                                  height: 16,
                                ),
                                GetBuilder<AppController>(builder: (_) {
                                  return CustomTextFormFiels(
                                    label: 'تأكيد كلمة السر',
                                    icon: Icons.lock,
                                    obscureText:
                                        controller.confirmPasswordVisibility,
                                    controller: confirmPasswordController,
                                    type: TextInputType.visiblePassword,
                                    suffix: IconButton(
                                      icon: Icon(
                                          controller.confirmPasswordVisibility
                                              ? Icons.visibility_off
                                              : Icons.visibility),
                                      onPressed: () {
                                        controller.changeconfirmPVisibility();
                                      },
                                    ),
                                    validator: (value) {
                                      if (value?.isEmpty ?? true) {
                                        return 'Field is required';
                                      } else if (confirmPasswordController
                                              .text !=
                                          passwordController.text) {
                                        return 'No match';
                                      } else {
                                        return null;
                                      }
                                    },
                                  );
                                }),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          CustomButton(
                            text: 'إنشاء الحساب',
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                               
                                  controller.registerUser(
                                      fullName: nameController.text,
                                      phoneNumber: phoneController.text,
                                      password: passwordController.text,
                                      passwordConfirmation:
                                          confirmPasswordController.text,
                                  
                                      endPoint: kRegisterUrl);
                               
                              } else {
                                autovalidateMode = AutovalidateMode.always;
                                setState(() {});
                              }
                            },
                          ),
                          const SizedBox(
                            height: 35,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                'لديك حساب؟',
                                style: TextStyle(
                                    color: ColorManager.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: kSomarFont),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(() => LoginScreen());
                                },
                                child: const Text(
                                  'تسجيل الدخول',
                                  style: TextStyle(
                                      color: ColorManager.orange,
                                      fontSize: 13,
                                      fontWeight: FontWeight.w700,
                                      fontFamily: kSomarFont),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          TextButton(
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              alignment: Alignment.center,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: const TextSpan(
                                    text: 'متابعتك تعني موافقتك على',
                                    style: TextStyle(
                                        color: ColorManager.blue,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: kSomarFont),
                                    children: [
                                      TextSpan(
                                        text:
                                            ' الشروط والأحكام وسياسة الخصوصية',
                                        style: TextStyle(
                                            color: ColorManager.orange,
                                            fontSize: 13,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: kSomarFont),
                                      )
                                    ]),
                              ),
                            ),
                            onPressed: () {},
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
