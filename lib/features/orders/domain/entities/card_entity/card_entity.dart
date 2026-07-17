class CardEntity {
  final String cardHolderName;
  final String cardNumber;
  final String cardCvv;
  final String cardExpiredDate;
  final String cardImageType;
  final bool markAsDefault;
  final String cardHolderId;

  CardEntity({
    required this.cardHolderName,
    required this.cardNumber,
    required this.cardCvv,
    required this.cardExpiredDate,
    required this.markAsDefault,
    required this.cardImageType,
    required this.cardHolderId,
  });
}
