import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'product.freezed.dart';
part 'product.g.dart';

@freezed
class Product with _$Product {
  factory Product({
    @Default('') dynamic id,
    @Default('') dynamic productName,
    @Default('') dynamic description,
    @Default('') dynamic quantity,
    @Default('') dynamic price,
    @Default('') dynamic imageBase64,
  }) = _Product;

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);
}
