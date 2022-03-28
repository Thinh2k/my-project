import 'package:flutter/material.dart';

import '../models/product_model.dart';
class OrderSummaryProductCard extends StatelessWidget {

  final Product product;
  final int quantity;

  const OrderSummaryProductCard({
    Key? key,
    required this.product,
    required this.quantity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    product.name,
                    style: Theme.of(context).textTheme.headline5),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Text(
                    '${product.price}\đ',
                    style: Theme.of(context).textTheme.headline4),
              ],
            ),
          )
        ],
      ),
    );
  }
}
