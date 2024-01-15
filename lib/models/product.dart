class Product {
  final int id;
  final String name, productType, brandName, imageUrl;
  final Price price;
  final bool hasVariantColours;
  final bool hasMultiplePrices;
  final int productCode;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.brandName,
    required this.hasVariantColours,
    required this.hasMultiplePrices,
    required this.productCode,
    required this.productType,
    required this.imageUrl,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: Price.fromJson(json["price"]),
        brandName: json["brandName"],
        hasVariantColours: json["hasVariantColours"],
        hasMultiplePrices: json["hasMultiplePrices"],
        productCode: json["productCode"],
        productType: json["productType"],
        imageUrl: json["imageUrl"],
      );
}

class Price {
  final Current current;
  final String currency;

  Price({
    required this.current,
    required this.currency,
  });

  factory Price.fromJson(Map<String, dynamic> json) => Price(
        current: Current.fromJson(json["current"]),
        currency: json["currency"],
      );
}

class Current {
  final double value;
  final String text;

  Current({
    required this.value,
    required this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}
