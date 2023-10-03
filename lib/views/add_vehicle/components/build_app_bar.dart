 import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';

AppBar buildAppBar() {
    return AppBar(
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
    );
  }