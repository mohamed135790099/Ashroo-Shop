import 'package:get/get.dart';

import '../controllers/main_getx_controller.dart';
import '../controllers/settings_controller.dart';

class MainBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(MainController());
  }

}