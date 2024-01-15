import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/providers/cart/cart_provider_state.dart';
import 'package:bridge_software_task/providers/products/products_provider.dart';
import 'package:bridge_software_task/utils/image_constants.dart';
import 'package:bridge_software_task/utils/string_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartItem extends ConsumerWidget {
  final CartProviderState state;

  const CartItem(this.state, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);

    if (data.products == null) return Container();

    final product = data.products!.firstWhere((element) => element.id == state.productId);
    final imageSize = 100.w;

    return Card(
      child: SizedBox(
        height: imageSize + 20,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: FadeInImage(
                  placeholder: const AssetImage(ImageConstants.placeholder),
                  image: NetworkImage(StringUtil.convertToUrl(product.imageUrl)),
                  width: imageSize,
                  height: imageSize,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '${product.name}\n',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.price.current.text,
                    style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  _counter(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _counter() {
    return Consumer(
      builder: (context, ref, child) {
        final cartNotifier = ref.read(cartProvider.notifier);

        return Row(
          children: [
            IconButton(
              onPressed: () => cartNotifier.decrement(state.productId),
              icon: const Icon(Icons.remove),
            ),
            IntrinsicWidth(
              child: Container(
                constraints: BoxConstraints(maxWidth: 40.w, minWidth: 30.w),
                padding: const EdgeInsets.all(5),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5.r),
                ),
                child: Text(
                  '${state.quantity}',
                  maxLines: 1,
                ),
              ),
            ),
            IconButton(
              onPressed: () => cartNotifier.increment(state.productId),
              icon: const Icon(Icons.add),
            ),
          ],
        );
      },
    );
  }
}
