import 'package:get/get.dart';
import 'package:quickorder/get/controllers/primary_controller.dart';

class PrimaryBinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PrimaryControler());
  }
}
