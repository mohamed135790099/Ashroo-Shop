import 'package:get/get.dart';

import '../controllers/auth_getx_controller.dart';
import '../controllers/settings_controller.dart';

class AuthBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(AuthController());
    Get.put(SettingsController());
  }

}