class FeaturedProductEntity {
  final String image;
  final String id;

  FeaturedProductEntity({required this.image, required this.id});

  FeaturedProductEntity copyWith({String? image}) {
    return FeaturedProductEntity(image: image ?? this.image, id: id);
  }
}
