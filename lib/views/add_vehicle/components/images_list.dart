import 'package:flutter/material.dart';
import 'package:khdne/controller/init_controller.dart';
import 'package:khdne/views/components/vehicle_image.dart';

SizedBox buildImagesList() {
    return SizedBox(
                              height: 200,
                              child: Directionality(
                                textDirection: TextDirection.ltr,
                                child: ListView.separated(
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return VehicleImage(
                                      image: controller.imagesMap.values
                                          .toList()[index],
                                      onTap: () {
                                        controller.removeImage(
                                            image: controller.imagesMap.values
                                                .toList()[index]);
                                      },
                                    );
                                  },
                                  separatorBuilder: (context, index) =>
                                      const SizedBox(
                                    width: 3,
                                  ),
                                  itemCount:
                                      controller.imagesMap.values.length,
                                ),
                              ),
                            );
  }

