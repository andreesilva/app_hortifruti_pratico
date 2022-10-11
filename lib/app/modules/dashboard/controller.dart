import 'package:get/get.dart';

class DashboardController extends GetxController {
  var currentPageIndex = 0.obs;

  void changepageIndex(int index) {
    currentPageIndex.value = index;
  }
}
