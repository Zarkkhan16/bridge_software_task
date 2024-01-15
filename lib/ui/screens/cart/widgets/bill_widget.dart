import 'package:bridge_software_task/models/product.dart';
import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/providers/cart/cart_provider_state.dart';
import 'package:bridge_software_task/providers/products/products_provider.dart';
import 'package:bridge_software_task/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BillWidget extends ConsumerWidget {
  const BillWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final products = ref.watch(productsProvider);

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide()),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              'Total',
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              _calculateTotal(products.products!, cart.toList()),
              style: TextStyle(fontSize: 15.sp),
            ),
          ),
          CustomButton(txt: 'Checkout', onPress: () {}),
        ],
      ),
    );
  }

  String _calculateTotal(List<Product> products, List<CartProviderState> cartItems) {
    double total = 0;
    String symbol = '';

    for (var item in cartItems) {
      final product = products.firstWhere((element) => item.productId == element.id);

      total += (product.price.current.value*item.quantity);
      symbol = product.price.current.text[0];
    }

    return '$symbol$total ';
  }
}
