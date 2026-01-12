import 'package:ecommerce_dash_board/features/orders/domain/entities/order_entity.dart';
import 'package:ecommerce_dash_board/features/orders/domain/entities/order_product_entity.dart';
import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key, required this.order});

  final OrderEntity order;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Container(
        color: const Color.fromARGB(21, 128, 74, 70),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// ===== Order Info =====
            Text('Order Info', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),
            Text('User ID: ${order.uId}'),
            Text('Payment Method: ${order.paymentMethod}'),
            Text('Total Price: ${order.totalPrice}'),
            const Divider(height: 32),

            /// ===== Shipping Address =====
            Text(
              'Shipping Address',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 8),
            _AddressItem(label: 'Name', value: order.shippingAddressModel.name),
            _AddressItem(
              label: 'Email',
              value: order.shippingAddressModel.email,
            ),
            _AddressItem(
              label: 'Phone',
              value: order.shippingAddressModel.phone,
            ),
            _AddressItem(
              label: 'Address',
              value: order.shippingAddressModel.address,
            ),
            _AddressItem(
              label: 'Details',
              value: order.shippingAddressModel.addressDetails,
            ),
            _AddressItem(label: 'City', value: order.shippingAddressModel.city),
            const Divider(height: 32),

            /// ===== Products =====
            Text('Products', style: Theme.of(context).textTheme.titleMedium),
            const SizedBox(height: 8),

            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: order.orderProducts.length,
              separatorBuilder: (_, __) => const Divider(),
              itemBuilder: (context, index) {
                final product = order.orderProducts[index];
                return _OrderProductItem(product: product);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _AddressItem extends StatelessWidget {
  const _AddressItem({required this.label, required this.value});

  final String label;
  final String? value;

  @override
  Widget build(BuildContext context) {
    if (value == null || value!.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text('$label: $value'),
    );
  }
}

class _OrderProductItem extends StatelessWidget {
  const _OrderProductItem({required this.product});

  final OrderProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.network(
          product.imageUrl,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name),
              Text('Code: ${product.code}'),
              Text('Price: ${product.price}'),
              Text('Quantity: ${product.quantity}'),
            ],
          ),
        ),
      ],
    );
  }
}
