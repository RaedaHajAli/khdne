import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';

class CustomDropDownButton extends StatelessWidget {
  const CustomDropDownButton({
    super.key,
    required this.image,
    required this.title,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  final String image;
  final String title;
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final void Function(String?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      value: value,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items,
          
      decoration: InputDecoration(
        label: Row(
          children: [
            Image.asset(image),
            const SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: const TextStyle(
                  color: ColorManager.blue,
                  fontSize: 14,
                  fontFamily: kSomarFont),
            ),
          ],
        ),
      ),
      onChanged: onChanged,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'This Field is required';
        } else {
          return null;
        }
      },
    );
  }
}
