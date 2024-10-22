import 'package:equatable/equatable.dart';

class WishlistProduct extends Equatable {
  const WishlistProduct({
    required this.productId,
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productExists,
    required this.productOutOfStock,
  });

  final String productId;
  final String productName;
  final double productPrice;
  final String productImage;
  final bool productExists;
  final bool productOutOfStock;

  const WishlistProduct.empty()
      : productId = '',
        productName = '',
        productPrice = 0.0,
        productImage = '',
        productExists = true,
        productOutOfStock = true;

  @override
  List<Object> get props {
    return [
      productId,
      productName,
      productPrice,
      productImage,
      productExists,
      productOutOfStock,
    ];
  }
}
