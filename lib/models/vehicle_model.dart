// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:io';

class VehicleModel {
  final String vehicleType;
  final String vehicleModel;
  final String vehicleColor;
  final String vehicleNumber;

  final File mechanicImage;
  final File vehicleImage;

  final File boardImage;
  final File idImage;
  final File delegateImage;
  VehicleModel({
    required this.vehicleType,
    required this.vehicleModel,
    required this.vehicleColor,
    required this.vehicleNumber,
    required this.mechanicImage,
    required this.vehicleImage,
    required this.boardImage,
    required this.idImage,
    required this.delegateImage,
  });
}
