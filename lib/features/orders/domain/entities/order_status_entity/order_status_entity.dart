class OrderStatusEntity {
  final bool acceptOrder;
  final DateTime? acceptedAt;

  final bool orderShipped;
  final DateTime? shippedAt;

  final bool outOfDelivery;
  final DateTime? outOfDeliveryAt;

  final bool orderDelivered;
  final DateTime? deliverdAt;

  OrderStatusEntity({
    this.acceptOrder = false,
    this.orderShipped = false,
    this.outOfDelivery = false,
    this.orderDelivered = false,
    this.acceptedAt,
    this.shippedAt,
    this.outOfDeliveryAt,
    this.deliverdAt,
  });
}
