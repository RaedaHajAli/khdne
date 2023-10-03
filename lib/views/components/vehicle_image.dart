import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khdne/models/color_manager.dart';

class VehicleImage extends StatelessWidget {
  const VehicleImage({super.key, required this.image, required this.onTap});
  final File image;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.file(
          image,
          height: 200,
          width: 200,
        ),
        InkWell(
          onTap: onTap,
          child: Positioned(
            top: 3,
            left: 3,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorManager.grey.withOpacity(0.2)),
                child: const Icon(
                  Icons.close,
                  color: ColorManager.black,
                )),
          ),
        ),
      ],
    );
  }
}
