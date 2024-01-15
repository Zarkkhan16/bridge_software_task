import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/ui/screens/cart/cart_screen.dart';
import 'package:bridge_software_task/ui/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

PreferredSizeWidget customAppBar() {
  return AppBar(
    leading: const Logo(size: 30),
    title: const Text('The Shopping App'),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.search),
      ),
      Consumer(
        builder: (context, ref, child) {
          final cart = ref.watch(cartProvider);

          return IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const CartScreen()));
            },
            icon: Badge(
              isLabelVisible: cart.isNotEmpty,
              label: Text(cart.length.toString()),
              child: const Icon(Icons.shopping_cart),
            ),
          );
        },
      ),
    ],
  );
}
