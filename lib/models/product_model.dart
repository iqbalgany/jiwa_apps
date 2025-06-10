class ProductModel {
  final int? id;
  final int? categoryId;
  final String? name;
  final String? price;
  final String? originalPrice;
  final String? imageUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? imageUrlText;

  ProductModel({
    this.id,
    this.categoryId,
    this.name,
    this.price,
    this.originalPrice,
    this.imageUrl,
    this.createdAt,
    this.updatedAt,
    this.imageUrlText,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        categoryId: json["category_id"],
        name: json["name"],
        price: json["price"],
        originalPrice: json["original_price"],
        imageUrl: json["image_url"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        imageUrlText: json["image_url_text"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category_id": categoryId,
        "name": name,
        "price": price,
        "original_price": originalPrice,
        "image_url": imageUrl,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "image_url_text": imageUrlText,
      };
}
