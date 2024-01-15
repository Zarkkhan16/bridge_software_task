class ProductDetail {
  final int id;
  final String name;
  final String description;
  final String gender;
  final String productCode;
  final String pdpLayout;
  final Brand brand;
  final Media media;
  final List<dynamic> badges;
  final Price price;
  final bool isDeadProduct;
  final ProductType productType;

  ProductDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.gender,
    required this.productCode,
    required this.pdpLayout,
    required this.brand,
    required this.media,
    required this.badges,
    required this.price,
    required this.isDeadProduct,
    required this.productType,
  });

  factory ProductDetail.fromJson(Map<String, dynamic> json) => ProductDetail(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        gender: json["gender"],
        productCode: json["productCode"],
        pdpLayout: json["pdpLayout"],
        brand: Brand.fromJson(json["brand"]),
        media: Media.fromJson(json["media"]),
        badges: List<dynamic>.from(json["badges"].map((x) => x)),
        price: Price.fromJson(json["price"]),
        isDeadProduct: json["isDeadProduct"],
        productType: ProductType.fromJson(json["productType"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "gender": gender,
        "productCode": productCode,
        "pdpLayout": pdpLayout,
        "brand": brand.toJson(),
        "media": media.toJson(),
        "badges": List<dynamic>.from(badges.map((x) => x)),
        "price": price.toJson(),
        "isDeadProduct": isDeadProduct,
        "productType": productType.toJson(),
      };
}

class Brand {
  final int brandId;
  final String name;
  final String description;

  Brand({
    required this.brandId,
    required this.name,
    required this.description,
  });

  factory Brand.fromJson(Map<String, dynamic> json) => Brand(
        brandId: json["brandId"],
        name: json["name"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "brandId": brandId,
        "name": name,
        "description": description,
      };
}

class Media {
  final List<Image> images;

  Media({
    required this.images,
  });

  factory Media.fromJson(Map<String, dynamic> json) => Media(
        images: List<Image>.from(json["images"].map((x) => Image.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
      };
}

class Image {
  final String url;
  final String type;
  final String colourCode;
  final String colour;
  final bool isPrimary;

  Image({
    required this.url,
    required this.type,
    required this.colourCode,
    required this.colour,
    required this.isPrimary,
  });

  factory Image.fromJson(Map<String, dynamic> json) => Image(
        url: json["url"],
        type: json["type"],
        colourCode: json["colourCode"],
        colour: json["colour"],
        isPrimary: json["isPrimary"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "type": type,
        "colourCode": colourCode,
        "colour": colour,
        "isPrimary": isPrimary,
      };
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

  Map<String, dynamic> toJson() => {
        "current": current.toJson(),
        "currency": currency,
      };
}

class Current {
  final double value;
  final String text;

  Current({
    required this.value,
    required this.text,
  });

  factory Current.fromJson(Map<String, dynamic> json) => Current(
        value: json["value"].toDouble(),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "value": value,
        "text": text,
      };
}

class ProductType {
  final int id;
  final String name;

  ProductType({
    required this.id,
    required this.name,
  });

  factory ProductType.fromJson(Map<String, dynamic> json) => ProductType(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}

class Rating {
  final int averageOverallRating;
  final int averageOverallStarRating;
  final int totalReviewCount;

  Rating({
    required this.averageOverallRating,
    required this.averageOverallStarRating,
    required this.totalReviewCount,
  });

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
        averageOverallRating: json["averageOverallRating"],
        averageOverallStarRating: json["averageOverallStarRating"],
        totalReviewCount: json["totalReviewCount"],
      );

  Map<String, dynamic> toJson() => {
        "averageOverallRating": averageOverallRating,
        "averageOverallStarRating": averageOverallStarRating,
        "totalReviewCount": totalReviewCount,
      };
}
