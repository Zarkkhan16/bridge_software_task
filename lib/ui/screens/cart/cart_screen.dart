import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/ui/screens/cart/widgets/bill_widget.dart';
import 'package:bridge_software_task/ui/screens/cart/widgets/cart_item.dart';
import 'package:bridge_software_task/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: cart.isEmpty
          ? Center(child: _emptyCart(context))
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cart.length,
                    itemBuilder: (context, index) {
                      final item = cart.elementAt(index);

                      return Dismissible(
                        key: Key(item.productId.toString()),
                        direction: DismissDirection.endToStart,
                        background: Container(
                          color: Colors.red,
                          child: Icon(Icons.delete, size: 40.h),
                        ),
                        onDismissed: (direction) {
                          ref.read(cartProvider.notifier).removeFromCart(item.productId);
                          cart.remove(item);
                        },
                        child: CartItem(item),
                      );
                    },
                  ),
                ),
                const BillWidget(),
              ],
            ),
    );
  }

  Widget _emptyCart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.remove_shopping_cart, size: 50.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 50.w, vertical: 20.h),
          child: CustomButton(
            txt: "Start Shopping",
            onPress: () => Navigator.pop(context),
          ),
        ),
      ],
    );
  }
}
