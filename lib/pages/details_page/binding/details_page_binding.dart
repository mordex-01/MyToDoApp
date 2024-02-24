import 'package:get/get.dart';
import 'package:test_1/pages/details_page/controller/details_page_controller.dart';

class DetailsPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DetailsPageController());
  }
}
