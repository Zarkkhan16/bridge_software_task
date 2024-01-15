enum ResponseStatus { failure, success, noInternet }

enum ApiMethod { get, post }

typedef Api = String;

class Apis {
  static const products = 'products/v2/list';
  static const productDetail = 'products/v3/detail';
}
