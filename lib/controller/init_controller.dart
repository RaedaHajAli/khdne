import 'package:get/get.dart';

import 'package:khdne/controller/app_controller.dart';

initController(){
   AppController controller = Get.put(AppController());
}
AppController controller = Get.find();