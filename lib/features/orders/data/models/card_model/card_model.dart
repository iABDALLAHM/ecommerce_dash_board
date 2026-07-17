import 'package:ecommerce_dash_board/features/orders/domain/entities/card_entity/card_entity.dart';

class CardModel {
  final String cardHolderName;
  final String cardNumber;
  final String cardCvv;
  final String cardExpiredDate;
  final String cardImageType;
  final bool markAsDefault;
  final String cardHolderId;

  CardModel({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cardCvv,
    required this.cardExpiredDate,
    required this.cardImageType,
    required this.markAsDefault,
    required this.cardHolderId,
  });

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardHolderName: json["cardHolderName"],
      cardNumber: json["cardNumber"],
      cardCvv: json["cardCvv"],
      cardExpiredDate: json["cardExpiredDate"],
      cardImageType: json["cardImageType"],
      markAsDefault: json["markAsDefault"],
      cardHolderId: json["cardHolderId"],
    );
  }

  CardEntity toEntity() {
    return CardEntity(
      cardHolderName: cardHolderName,
      cardNumber: cardNumber,
      cardCvv: cardCvv,
      cardExpiredDate: cardExpiredDate,
      markAsDefault: markAsDefault,
      cardImageType: cardImageType,
      cardHolderId: cardHolderId,
    );
  }
}
