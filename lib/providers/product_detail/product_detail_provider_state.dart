import 'package:bridge_software_task/models/product_detail.dart';
import 'package:bridge_software_task/network/api_constants.dart';

class ProductDetailProviderState {
  final bool isLoading;
  final ProductDetail? detail;
  final dynamic error;
  final ResponseStatus? responseStatus;

  ProductDetailProviderState({
    required this.isLoading,
    this.detail,
    this.error,
    this.responseStatus,
  });

  factory ProductDetailProviderState.loading() {
    return ProductDetailProviderState(isLoading: true);
  }

  factory ProductDetailProviderState.success(ProductDetail detail) {
    return ProductDetailProviderState(
      isLoading: false,
      responseStatus: ResponseStatus.success,
      detail: detail,
    );
  }

  factory ProductDetailProviderState.failure(ResponseStatus status, error) {
    return ProductDetailProviderState(
      isLoading: false,
      responseStatus: status,
      error: error,
    );
  }
}
