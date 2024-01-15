import 'package:bridge_software_task/models/product.dart';
import 'package:bridge_software_task/network/api_constants.dart';

class ProductsProviderState {
  final bool isLoading;
  final List<Product>? products;
  final dynamic error;
  final ResponseStatus? responseStatus;

  ProductsProviderState({
    required this.isLoading,
    this.products,
    this.error,
    this.responseStatus,
  });

  factory ProductsProviderState.loading() {
    return ProductsProviderState(isLoading: true);
  }

  factory ProductsProviderState.success(List<Product> products) {
    return ProductsProviderState(
      isLoading: false,
      responseStatus: ResponseStatus.success,
      products: products,
    );
  }

  factory ProductsProviderState.failure(ResponseStatus status, error) {
    return ProductsProviderState(
      isLoading: false,
      responseStatus: status,
      error: error,
    );
  }

}
