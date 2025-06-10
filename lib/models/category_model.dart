import 'product_model.dart';

class CategoryModel {
  final int? id;
  final String? name;
  final String? type;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<ProductModel>? products;

  CategoryModel({
    this.id,
    this.name,
    this.type,
    this.createdAt,
    this.updatedAt,
    this.products,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        products: json["products"] == null
            ? []
            : List<ProductModel>.from(
                json["products"]!.map((x) => ProductModel.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "products": products == null
            ? []
            : List<dynamic>.from(products!.map((x) => x.toJson())),
      };
}
