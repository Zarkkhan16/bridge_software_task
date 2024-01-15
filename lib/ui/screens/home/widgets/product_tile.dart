import 'package:bridge_software_task/models/product.dart';
import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/providers/cart/cart_provider_state.dart';
import 'package:bridge_software_task/utils/image_constants.dart';
import 'package:bridge_software_task/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductTile extends ConsumerWidget {
  final Product product;

  const ProductTile(this.product, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.read(cartProvider.notifier);
    final imageUrl = StringUtil.convertToUrl(product.imageUrl);

    bool contains = cart.contains(CartProviderState(productId: product.id, quantity: 0));

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.r),
              child: FadeInImage(
                fit: BoxFit.cover,
                placeholder: const AssetImage(ImageConstants.placeholder),
                image: NetworkImage(imageUrl),
              ),
            ),
            Text(
              '${product.name}\n',
              maxLines: 2,
              style: TextStyle(fontSize: 14.sp),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 5.w),
                    child: Text(
                      product.price.current.text,
                      maxLines: 2,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      if (contains) {
                        cartNotifier.removeFromCart(product.id);
                      } else {
                        cartNotifier.addToCart(product.id);
                      }
                    },
                    icon: contains
                        ? Icon(
                            Icons.remove_shopping_cart,
                            color: Theme.of(context).primaryColor,
                          )
                        : const Icon(Icons.add_shopping_cart),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
