// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';

part "product.g.dart";

@JsonSerializable()
class Product {
  String name;
  double price;
  bool inStock;

  Product({
    required this.name,
    required this.price,
    required this.inStock,
    
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return _$ProductFromJson(json);
  }

  toJson(){
    return _$ProductToJson(this);
  }
}
