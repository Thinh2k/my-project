part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();

  @override
  List<Object> get props => [];
}

class LoadProducts extends ProductEvent {}

class UpdateProducts extends ProductEvent {
  final List<Product> product;

  UpdateProducts(this.product);

  @override
  List<Object> get props => [product];
}