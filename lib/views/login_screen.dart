import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/controller/app_controller.dart';
import 'package:khdne/controller/init_controller.dart';
import 'package:khdne/models/color_manager.dart';
import 'package:khdne/models/images_manager.dart';
import 'package:khdne/views/components/custom_button.dart';
import 'package:khdne/views/components/custom_text_field.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<AppController>(builder: (_) {
        return ModalProgressHUD(
          inAsyncCall: controller.loginProcess,
          child: SingleChildScrollView(
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
                        ImagesManager.khdneLogo,
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
                                    'تسجيل الدخول',
                                    style: TextStyle(
                                        color: ColorManager.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: kSomarFont),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Form(
                                key: formKey,
                                autovalidateMode: autovalidateMode,
                                child: Column(
                                  children: [
                                    CustomTextFormField(
                                        label: 'رقم الهاتف',
                                        prefixIcon: const Icon(
                                          Icons.call,
                                          color: ColorManager.orange,
                                          size: 18,
                                        ),
                                        controller: phoneController,
                                        type: TextInputType.phone),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    GetBuilder<AppController>(builder: (_) {
                                      return CustomTextFormField(
                                        label: 'كلمة السر',
                                        prefixIcon: const Icon(
                                          Icons.lock,
                                          color: ColorManager.orange,
                                          size: 18,
                                        ),
                                        obscureText:
                                            controller.passwordLoginVisibility,
                                        controller: passwordController,
                                        type: TextInputType.visiblePassword,
                                        suffix: IconButton(
                                          icon: Icon(
                                              controller.passwordLoginVisibility
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                          onPressed: () {
                                            controller
                                                .changePasswordLoginVisibility();
                                          },
                                        ),
                                      );
                                    }),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 16,
                              ),
                              const Text(
                                'هل نسيت كلمة السر؟',
                                style: TextStyle(
                                    color: ColorManager.blue,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: kSomarFont),
                              ),
                              const SizedBox(
                                height: 75,
                              ),
                              CustomButton(
                                text: 'تسجيل الدخول',
                                onTap: () {
                                  if (formKey.currentState!.validate()) {
                                    controller.loginUser(
                                        phoneNumber: phoneController.text,
                                        password: passwordController.text,
                                        endPoint: kLoginUrl);
                                  } else {
                                    autovalidateMode = AutovalidateMode.always;
                                    setState(() {});
                                  }
                                },
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'ليس لديك حساب؟',
                                    style: TextStyle(
                                        color: ColorManager.blue,
                                        fontSize: 13,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: kSomarFont),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text(
                                      'إنشاء حساب',
                                      style: TextStyle(
                                          color: ColorManager.orange,
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: kSomarFont),
                                    ),
                                  ),
                                ],
                              ),
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
      }),
    );
  }
}
