import 'package:bridge_software_task/models/product_detail.dart';
import 'package:bridge_software_task/network/api_client.dart';
import 'package:bridge_software_task/network/api_constants.dart';
import 'package:bridge_software_task/providers/product_detail/product_detail_provider_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productDetailProvider = StateNotifierProvider.autoDispose.family<ProductDetailProvider, ProductDetailProviderState, int>(
  (ref, productId) => ProductDetailProvider(
    productId,
    ProductDetailProviderState.loading(),
  ),
);

class ProductDetailProvider extends StateNotifier<ProductDetailProviderState> {
  ProductDetailProvider(int productId, super.state) {
    getProductDetail(productId);
  }

  void getProductDetail(int productId) async {
    state = ProductDetailProviderState.loading();

    final response = await ApiClient.makeRequest(
      method: ApiMethod.get,
      api: Apis.productDetail,
      params: {'id': productId},
    );

    if (response.$1 == ResponseStatus.success) {
      final detail = ProductDetail.fromJson(response.$2);
      state = ProductDetailProviderState.success(detail);
    } else {
      state = ProductDetailProviderState.failure(response.$1, response.$2);
    }
  }
}
