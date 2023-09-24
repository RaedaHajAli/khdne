import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';

class CustomTextFormFiels extends StatelessWidget {
  const CustomTextFormFiels(
      {super.key,
      required this.label,
      required this.icon,
      required this.controller,
      required this.type,
      this.suffix,
      this.validator,
      this.obscureText, });
  final String label;
  final IconData icon;
  final TextEditingController controller;
  final TextInputType type;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final bool? obscureText;
 
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      obscureText: obscureText ?? false,
      textDirection: TextDirection.ltr,
      textAlign: TextAlign.end,
      controller: controller,
    
      validator: validator ??
          (value) {
            if (value?.isEmpty ?? true) {
              return 'Field is required';
            } else {
              return null;
            }
          },
      decoration: InputDecoration(
          label: Row(
            children: [
              Icon(
                icon,
                color: ColorManager.orange,
                size: 18,
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                label,
                style: const TextStyle(
                    color: ColorManager.blue,
                    fontSize: 14,
                    fontFamily: kSomarFont),
              ),
            ],
          ),
          suffixIcon: suffix,
          border: const UnderlineInputBorder(
              borderSide: BorderSide(color: ColorManager.grey))),
    );
  }
}
