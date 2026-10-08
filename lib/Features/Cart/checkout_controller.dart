import 'package:get/get.dart';

class CheckoutController extends GetxController {
  final List<Map<String, dynamic>> checkoutItems;
  final bool? isFromProductDescription;

  CheckoutController({
    required this.checkoutItems,
    this.isFromProductDescription,
  });

  double totalPrice() {
    double total = 0;

    for (var item in checkoutItems) {
      double price = (item["price"] ?? 0).toDouble();
      int quantity = item["quantity"] ?? 1;

      total += price * quantity;
    }

    return total;
  }


}
