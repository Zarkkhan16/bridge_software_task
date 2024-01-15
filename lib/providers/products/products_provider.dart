import 'package:bridge_software_task/models/product.dart';
import 'package:bridge_software_task/network/api_client.dart';
import 'package:bridge_software_task/network/api_constants.dart';
import 'package:bridge_software_task/providers/products/products_provider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productsProvider = StateNotifierProvider<ProductsProvider, ProductsProviderState>(
  (ref) => ProductsProvider(ProductsProviderState.loading()),
);

class ProductsProvider extends StateNotifier<ProductsProviderState> {
  ProductsProvider(super.state) {
    getProducts();
  }

  void getProducts() async {
    state = ProductsProviderState.loading();

    final response = await ApiClient.makeRequest(
      method: ApiMethod.get,
      api: Apis.products,
      params: {'categoryId': 4209},
    );

    if (response.$1 == ResponseStatus.success) {
      final products = List.from(response.$2['products']).map((json) => Product.fromJson(json)).toList();
      state = ProductsProviderState.success(products);
    } else {
      state = ProductsProviderState.failure(response.$1, response.$2);
    }
  }
}
