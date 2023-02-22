// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Product _$$_ProductFromJson(Map<String, dynamic> json) => _$_Product(
      id: json['id'] ?? '',
      productName: json['productName'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] ?? '',
      price: json['price'] ?? '',
      imageBase64: json['imageBase64'] ?? '',
    );

Map<String, dynamic> _$$_ProductToJson(_$_Product instance) =>
    <String, dynamic>{
      'id': instance.id,
      'productName': instance.productName,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imageBase64': instance.imageBase64,
    };
