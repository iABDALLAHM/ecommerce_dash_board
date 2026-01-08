import 'dart:io';

class ProductEntity {
  final String name;
  final num price;
  final File image;
  final String code;
  final String discription;
  final bool isFeatured;
  final String? imageUrl;

  ProductEntity({
    required this.name,
    required this.price,
    required this.image,
    required this.code,
    required this.discription,
    required this.isFeatured,
    this.imageUrl,
  });
}
