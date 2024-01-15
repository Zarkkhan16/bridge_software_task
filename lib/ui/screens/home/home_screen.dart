import 'package:bridge_software_task/models/product.dart';
import 'package:bridge_software_task/network/api_constants.dart';
import 'package:bridge_software_task/providers/products/products_provider.dart';
import 'package:bridge_software_task/ui/screens/home/widgets/product_tile.dart';
import 'package:bridge_software_task/ui/screens/home/widgets/promotions_slider.dart';
import 'package:bridge_software_task/ui/screens/product_detail/product_detail_screen.dart';
import 'package:bridge_software_task/ui/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final data = ref.watch(productsProvider);
    Widget body;

    if (data.isLoading) {
      body = Center(
        child: SpinKitRotatingCircle(
          color: Theme.of(context).primaryColor,
          size: 50.0,
        ),
      );
    } else {
      switch (data.responseStatus) {
        case ResponseStatus.failure:
          body = Center(
            child: _errorWidget(data.error.toString(), Icons.error),
          );
          break;
        case ResponseStatus.noInternet:
          body = Center(
            child: _errorWidget(data.error.toString(), Icons.network_check),
          );
          break;
        case ResponseStatus.success:
          body = _successWidget(data.products!);
          break;
        case null:
          body = Container();
      }
    }

    return Scaffold(
      appBar: customAppBar(),
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

  Widget _successWidget(List<Product> products) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(child: PromotionsSlider()),
        SliverPadding(
          padding: const EdgeInsets.all(7),
          sliver: SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) => GestureDetector(
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                  builder: (_) => ProductDetailScreen(products[index].id),
                )),
                child: ProductTile(products[index]),
              ),
              childCount: products.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,
              childAspectRatio: 0.59,
            ),
          ),
        ),
      ],
    );
  }
}
