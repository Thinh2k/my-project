part of 'wishlist_bloc.dart';

@immutable
abstract class WishlistEvent extends Equatable {
  const WishlistEvent();
}

class LoadWishList extends WishlistEvent {
  @override
  List<Object> get props => [];
}

class AddProductToWishList extends WishlistEvent {
  final Product product;

  const AddProductToWishList(this.product);

  @override
  List<Object> get props => [product];
}

class RemoveProductFromWishList extends WishlistEvent {
  final Product product;

  const RemoveProductFromWishList(this.product);

  @override
  List<Object> get props => [product];
}