import 'package:bridge_software_task/models/product_detail.dart';
import 'package:bridge_software_task/network/api_constants.dart';
import 'package:bridge_software_task/providers/cart/cart_provider.dart';
import 'package:bridge_software_task/providers/cart/cart_provider_state.dart';
import 'package:bridge_software_task/providers/product_detail/product_detail_provider.dart';
import 'package:bridge_software_task/ui/screens/product_detail/widget/images_slider.dart';
import 'package:bridge_software_task/ui/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ProductDetailScreen extends ConsumerWidget {
  final int id;

  const ProductDetailScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);
    final cartNotifier = ref.watch(cartProvider.notifier);
    final detail = ref.watch(productDetailProvider(id));
    bool contains = cart.contains(
        CartProviderState(productId: id, quantity: 0));


    String title = '';
    Widget body = Container();

    if (detail.isLoading) {
      body = Center(
        child: SpinKitRotatingCircle(
          color: Theme
              .of(context)
              .primaryColor,
          size: 50.0,
        ),
      );
    }

    switch (detail.responseStatus) {
      case ResponseStatus.failure:
        body = Center(
          child: _errorWidget(detail.error.toString(), Icons.error),
        );
        break;
      case ResponseStatus.noInternet:
        body = Center(
          child: _errorWidget(detail.error.toString(), Icons.network_check),
        );
        break;
      case ResponseStatus.success:
        title = detail.detail!.name;
        body = _successWidget(cartNotifier, detail.detail!,contains);
        break;
      case null:
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: body,
    );
  }

  Widget _errorWidget(String msg, IconData icon) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 70.h,
        ),
        Text(
          msg,
          style: TextStyle(fontSize: 15.sp),
        ),
      ],
    );
  }

  Widget _successWidget(CartProvider cartNotifier, ProductDetail detail,bool? contains) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              ImagesSlider(detail.media),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      detail.name,
                      style: TextStyle(
                          fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      detail.price.current.text,
                      style: TextStyle(fontSize: 15.sp),
                    ),
                    Html(
                      data: """
                <h1>Detail</h1>
                ${detail.description}
                      """,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CustomButton(
            txt:contains==true?'Remove from cart':'Add to cart',
            onPress: () {
              if (contains==true) {
                cartNotifier.removeFromCart(detail.id);
              } else {
                cartNotifier.addToCart(detail.id);              }

              },
          ),
        ),
      ],
    );
  }
}
