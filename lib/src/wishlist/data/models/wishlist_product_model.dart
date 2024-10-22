import 'dart:convert';

import 'package:dbestech_ecomly/core/utils/typedefs.dart';
import 'package:dbestech_ecomly/src/wishlist/domain/entities/wishlist_product.dart';

class WishlistProductModel extends WishlistProduct {
  const WishlistProductModel(
      {required super.productId,
      required super.productName,
      required super.productPrice,
      required super.productImage,
      required super.productExists,
      required super.productOutOfStock});

  const WishlistProductModel.empty()
      : this(
          productExists: true,
          productOutOfStock: true,
          productId: '',
          productName: '',
          productPrice: 0.0,
          productImage: '',
        );

  WishlistProductModel copyWith({
    String? productId,
    String? productName,
    double? productPrice,
    String? productImage,
    bool? productExists,
    bool? productOutOfStock,
  }) {
    return WishlistProductModel(
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      productPrice: productPrice ?? this.productPrice,
      productImage: productImage ?? this.productImage,
      productExists: productExists ?? this.productExists,
      productOutOfStock: productOutOfStock ?? this.productOutOfStock,
    );
  }

  DataMap toMap() {
    return <String, dynamic>{
      'productId': productId,
      'productName': productName,
      'productPrice': productPrice,
      'productImage': productImage,
      'productExists': productExists,
      'productOutOfStock': productOutOfStock,
    };
  }

  factory WishlistProductModel.fromMap(DataMap map) {
    return WishlistProductModel(
      productId: map['productId'] as String,
      productName: map['productName'] as String,
      productPrice: (map['productPrice'] as num).toDouble(),
      productImage: map['productImage'] as String,
      productExists: map['productExists'] as bool? ?? true,
      productOutOfStock: map['productOutOfStock'] as bool? ?? false,
    );
  }

  String toJson() => jsonEncode(toMap());

  factory WishlistProductModel.fromJson(String source) =>
      WishlistProductModel.fromMap(jsonDecode(source) as DataMap);
}
