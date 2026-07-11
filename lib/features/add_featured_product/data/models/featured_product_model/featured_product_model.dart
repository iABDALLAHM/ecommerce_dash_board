import 'package:ecommerce_dash_board/features/add_featured_product/domain/entities/featured_product_entity/featured_product_entity.dart';

class FeaturedProductModel {
  final String imageUrl;
  final String id;

  FeaturedProductModel({required this.imageUrl, required this.id});

  factory FeaturedProductModel.fromEntity({
    required FeaturedProductEntity productEntity,
  }) {
    return FeaturedProductModel(
      imageUrl: productEntity.image,
      id: productEntity.id,
    );
  }

  Map<String, dynamic> toMap() {
    return {"imageUrl": imageUrl, "id": id};
  }
}
