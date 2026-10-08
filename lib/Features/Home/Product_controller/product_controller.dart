import 'package:get/get.dart';

class ProductController extends GetxController {
  RxInt selectedIndex = 0.obs;
  RxInt colorSelectedIndex = 0.obs;
  RxBool isLikeButton = true.obs;
  RxInt quantity = 1.obs;

  quantityIncrement() {
    quantity.value++;
  }

  quantityDecrement() {
    quantity.value--;
  }
}
