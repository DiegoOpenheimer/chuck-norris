import 'package:chuck_norris/src/home/home.viewmodel.dart';
import 'package:get/get.dart';

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeViewModel(Get.find()));
  }
}