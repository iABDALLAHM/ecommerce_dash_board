import 'package:ecommerce_dash_board/features/add_product/domain/entities/review_entity.dart';

class ReviewModel {
  final String name;
  final String image;
  final double rating;
  final String date;
  final String reviewDescription;

  ReviewModel({
    required this.name,
    required this.image,
    required this.rating,
    required this.date,
    required this.reviewDescription,
  });

  factory ReviewModel.fromEntity({required ReviewEntity reviewEntity}) {
    return ReviewModel(
      name: reviewEntity.name,
      image: reviewEntity.image,
      rating: reviewEntity.rating,
      date: reviewEntity.date,
      reviewDescription: reviewEntity.reviewDescription,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "name": name,
      "image": image,
      "rating": rating,
      "date": date,
      "reviewDescription": reviewDescription,
    };
  }
}
