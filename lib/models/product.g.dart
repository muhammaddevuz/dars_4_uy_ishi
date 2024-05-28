// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      inStock: json['inStock'] as bool,
    );

Map<String, Object> _$ProductToJson(Product instance) => <String, Object>{
      'name': instance.name,
      'price': instance.price,
      'inStock': instance.inStock,
    };
