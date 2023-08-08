import 'package:get/get.dart';
import 'package:roomfinding/controllers/Blogpage_controller.dart';
import 'package:roomfinding/controllers/drawer_controller.dart';
import 'package:roomfinding/controllers/searchController.dart';
import 'package:roomfinding/controllers/wallet_controller.dart';

import '../controllers/navigator_controllers.dart';

class MyBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NavigatorController());
    Get.lazyPut(() => WalletController());
    Get.lazyPut(() => MainDrawerController());
    Get.lazyPut<searchController>(
      () => searchController(),
    );
    Get.lazyPut(() => blogpageContoller());
  }
}
