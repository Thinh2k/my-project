import 'package:equatable/equatable.dart';
import 'package:shopfood/models/models.dart';

class Checkout extends Equatable {
  final String? fullName;
  final String? email;
  final String? telephone;
  final String? address;
  final String? zipCode;

  final List<Product>? products;
  final String? subtotal;
  final String? deliveryFee;
  final String? total;

  const Checkout({
    required this.fullName,
    required this.email,
    required this.telephone,
    required this.address,
    required this.zipCode,
    required this.products,
    required this.subtotal,
    required this.deliveryFee,
    required this.total,
  });

  @override
  List<Object?> get props => [
    fullName,
    email,
    telephone,
    address,
    zipCode,
    products,
    subtotal,
    deliveryFee,
    total,
  ];

  Map<String, Object> toDocument() {
    Map customerAddress = Map();
    customerAddress['address'] = address;
    customerAddress['zipCode'] = zipCode;

    return {
      'customerAddress': customerAddress,
      'customerName': fullName!,
      'customerEmail': email!,
      'customerTelephone': telephone!,
      'products': products!.map((product) => product.name).toList(),
      'subtotal': subtotal!,
      'deliveryFree': deliveryFee!,
      'total': total!
    };
  }
}