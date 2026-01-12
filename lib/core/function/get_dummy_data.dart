import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_product_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/shipping_address_entity.dart';

final dummyOrder = OrderEntity(
  totalPrice: 300,
  uId: 'USER_123',
  paymentMethod: 'Cash',
  shippingAddressModel: ShippingAddressEntity(
    name: 'عبدالله محمد',
    email: 'abdallah@gmail.com',
    phone: '01012345678',
    address: 'شارع فيصل',
    addressDetails: 'الدور الثالث - شقة 3',
    city: 'الجيزة',
  ),
  orderProducts: [
    OrderProductEntity(
      name: 'T-Shirt',
      code: 'TSHIRT_001',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
      quantity: 2,
    ),
    OrderProductEntity(
      name: 'Shoes',
      code: 'SHOES_002',
      imageUrl: 'https://via.placeholder.com/150',
      price: 100,
      quantity: 1,
    ),
  ],
);
