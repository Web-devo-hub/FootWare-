
import 'package:get/get.dart';

import '../../constants/constants.dart';

class CartController extends GetxController {
  RxList<Map<String, dynamic>> localCheckoutListItems =
      <Map<String, dynamic>>[].obs;

  RxList<int> quantities = <int>[].obs;

  @override
  void onInit() {
    super.onInit();
    localCheckoutListItems.assignAll(List.from(SingletonList.cartItems ?? []));
    quantities.assignAll(
      localCheckoutListItems.map((l) => (l['quantity'] ?? 1) as int),
    );

  }
  void setQuantity(int index, int value) {
    quantities[index] = value;
    localCheckoutListItems[index]['quantity'] = value;
  }

  void removeAt(int index) {
    SingletonList.cartItems?.removeAt(index);
    localCheckoutListItems.removeAt(index);
    quantities.removeAt(index);
  }

  double get TotalPrice {
    double total = 0;

    for(int i = 0 ; i < localCheckoutListItems.length ; i++ ) {

      total += (localCheckoutListItems[i]["price"] ?? 0) * quantities[i];
    }
    return total;
  }


}
