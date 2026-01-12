import 'package:ecommerce_dash_board/features/orders/domain/entities/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? phone;
  String? address;
  String? addressDetails;
  String? city;

  ShippingAddressModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.addressDetails,
    required this.city,
  });

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      addressDetails: json["addressDetails"],
      city: json["city"],
    );
  }

  ShippingAddressEntity toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      phone: phone,
      address: address,
      addressDetails: addressDetails,
      city: city,
    );
  }
}
