import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:khdne/constants.dart';
import 'package:khdne/models/color_manager.dart';

Container buildNoImageWidget() {
    return Container(
                            width: 200,
                            height: 200,
                            child: DottedBorder(
                                dashPattern: const [8, 3],
                                strokeWidth: 1,
                                padding: const EdgeInsets.all(8),
                                borderPadding: const EdgeInsets.all(4),
                                color: ColorManager.grey.withOpacity(0.8),
                                child: SizedBox(
                                  width: double.infinity,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                          height: 40,
                                          width: 40,
                                          decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: ColorManager.grey
                                                  .withOpacity(0.2)),
                                          child: const Icon(
                                            Icons.add,
                                            color: ColorManager.orange,
                                          )),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        'إضافة صورة',
                                        style: TextStyle(
                                            color: ColorManager.greyBold,
                                            fontSize: 14,
                                            fontFamily: kSomarFont),
                                      )
                                    ],
                                  ),
                                )),
                          );
  }