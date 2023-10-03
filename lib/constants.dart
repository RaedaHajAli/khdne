import 'package:flutter/material.dart';

const String kSomarFont = 'Somar';
const String kRegisterUrl = 'register';
const String kLoginUrl = 'login';
const String kVehicleUrl = 'Vehicle';
List<DropdownMenuItem<String>> vehicleTypeList = const [
  DropdownMenuItem(
    value: '1',
    child: Text('Marcedes'),
  ),
  DropdownMenuItem(
    value: '2',
    child: Text(
      'BMW',
    ),
  ),
  DropdownMenuItem(
    value: '3',
    child: Text(
      'Ford',
    ),
  ),
  DropdownMenuItem(
    value: '4',
    child: Text('Hyundai'),
  ),
];

List<DropdownMenuItem<String>> vehicleColorList = const [
  'Black',
  'Red',
  'White',
  'Blue',
  'Grey',
]
    .map((e) => DropdownMenuItem(
          value: e,
          child: Text(e),
        ))
    .toList();
