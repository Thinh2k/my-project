import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/cart/cart_bloc.dart';
import 'package:shopfood/blocs/checkout/checkout_bloc.dart';
import 'package:shopfood/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopfood/models/models.dart';

class CustomNavbar extends StatelessWidget {
  final String screen;
  final Product? product;

  const CustomNavbar({
    Key? key,
    required this.screen,
    this.product,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: Colors.green,
      child: Container(
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _selectNavBar(context, screen)!,
        ),
      ),
    );
  }

  List<Widget>? _selectNavBar(context, screen) {
    switch (screen) {
      case '/':
        return _buildNavBar(context);
      case '/login':
        return _buildNavBar(context);
      case '/register':
        return _buildNavBar(context);
      case '/catalog':
        return _buildNavBar(context);
      case '/home':
        return _buildNavBar(context);
      case '/information':
        return _buildNavBar(context);
      case '/profile':
        return _buildNavBar(context);
      case '/user':
        return _buildNavBar(context);
      case '/userform':
        return _buildNavBar(context);
      case '/order-confirmation':
        return _buildNavBar(context);
      case '/wishlist':
        return _buildNavBar(context);
      case '/product':
        return _buildAddToCartNavBar(context, product);
      case '/cart':
        return _buildGoToCheckoutNavBar(context);
      case '/checkout':
        return _buildOrderNowNavBar(context);

      default:
        _buildNavBar(context);
    }
  }

  List<Widget> _buildNavBar(context) {
    return [
      IconButton(
        icon: Icon(Icons.home, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/home');
        },
      ),
      IconButton(
        icon: Icon(Icons.shopping_cart, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/cart');
        },
      ),
      IconButton(
        icon: Icon(Icons.account_circle, color: Colors.white),
        onPressed: () {
          Navigator.pushNamed(context, '/user');
        },
      ),
    ];
  }

  List<Widget> _buildAddToCartNavBar(context, product) {
    return [
      BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if (state is WishlistLoading) {
            return CircularProgressIndicator();
          }
          if (state is WishlistLoaded) {
            return IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                final snackBar =
                SnackBar(content: Text('Đã thêm vào danh sách yêu thích'));
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                context.read<WishlistBloc>().add(AddProductToWishList(product));
              },
            );  
          }
          return Text('Đã xảy ra sự cố');
        },
      ),
      BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartLoading) {
            return CircularProgressIndicator();
          }
          if (state is CartLoaded) {
            return ElevatedButton(
              onPressed: () {
                context.read<CartBloc>().add(AddProduct(product));
                Navigator.pushNamed(context, '/cart');
              },
              style: ElevatedButton.styleFrom(
                primary: Colors.white,
                shape: RoundedRectangleBorder(),
              ),
              child: Text(
                'Thêm vào giỏ hàng',
                style: Theme
                    .of(context)
                    .textTheme
                    .headline3,
              ),
            );
          }
          return Text('Đã xảy ra sự cố');
        },
      )
    ];
  }

  List<Widget> _buildGoToCheckoutNavBar(context) {
    return [
      ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, '/checkout');
        },
        style: ElevatedButton.styleFrom(
          primary: Colors.white,
          shape: RoundedRectangleBorder(),
        ),
        child: Text(
          'Thanh toán',
          style: Theme
              .of(context)
              .textTheme
              .headline3,
        ),
      )
    ];
  }

  List<Widget> _buildOrderNowNavBar(context) {
    return [
      BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            if(state is CheckoutLoading){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(state is CheckoutLoaded){
              return ElevatedButton(
                onPressed: () {
                  context.read<CheckoutBloc>()
                  .add(ConfirmCheckout(
                      checkout: state.checkout));

                  Navigator.pushNamed(context, '/order-confirmation');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  shape: RoundedRectangleBorder(),
                ),
                child: Text(
                  'Đặt hàng',
                  style: Theme.of(context).textTheme.headline3,
                ),
              );
            }
            else {
              return Text('Đã xảy ra sự cố');
            }
          })
    ];
  }
}