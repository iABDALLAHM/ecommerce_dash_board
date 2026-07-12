class ProductEntity {
  final String productName;
  final num productPrice;
  final String productImage;
  final String productCode;
  final String productDiscription;
  final bool isOrganicProduct;
  final int expirationYears;
  final int numberOfCalories;
  final int unitAmount;

  ProductEntity({
    required this.productName,
    required this.productPrice,
    required this.productImage,
    required this.productCode,
    required this.productDiscription,
    required this.isOrganicProduct,
    required this.expirationYears,
    required this.numberOfCalories,
    required this.unitAmount,
  });

  ProductEntity copyWith({String? productImage}) {
    return ProductEntity(
      productName: productName,
      productPrice: productPrice,
      productImage: productImage ?? this.productImage,
      productCode: productCode,
      productDiscription: productDiscription,
      isOrganicProduct: isOrganicProduct,
      expirationYears: expirationYears,
      numberOfCalories: numberOfCalories,
      unitAmount: unitAmount,
    );
  }
}
