import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({this.onTap, required this.text,this.color});
  final String text;
  final VoidCallback? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
            color:color?? ColorManager.blue, borderRadius: BorderRadius.circular(25)),
        alignment: Alignment.center,
        child: Text(text,
            style: const TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: kSomarFont,
             
                )),
      ),
    );
  }
}
