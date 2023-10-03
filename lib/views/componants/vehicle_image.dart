import 'dart:io';

import 'package:flutter/material.dart';

class VehicleImage extends StatelessWidget {
  const VehicleImage({super.key, required this.image});
  final File image;

  @override
  Widget build(BuildContext context) {
    return Image.file(image,height: 200,width: 200,);
  }
}
