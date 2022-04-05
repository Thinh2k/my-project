import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/models/category_model.dart';
import 'package:shopfood/models/models.dart';
import 'package:shopfood/screens/cart/cart_screen.dart';
import 'package:shopfood/screens/catalog/catalog_screen.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/screens/product/product_screen.dart';
import 'package:shopfood/screens/screens.dart';
import 'package:shopfood/screens/order_confirmation_screen/order_confirmation.dart';

import '../screens/checkout/checkout_screen.dart';

class AppRouter{
  static Route onGenerateRoute(RouteSettings settings) {
    print('This is route: ${settings.name}');

    switch (settings.name) {
      case '/':
        return LoginScreen.route();
      case LoginScreen.routeName:
        return LoginScreen.route();
      case RegisterScreen.routeName:
        return RegisterScreen.route();
      case HomeScreen.routeName:
        return HomeScreen.route();
      case InformationScreen.routeName:
        return InformationScreen.route();
      case UserScreen.routeName:
        return UserScreen.route();
      case UserForm.routeName:
        return UserForm.route();
      case ProfileScreen.routeName:
        return ProfileScreen.route();
      case CartScreen.routeName:
        return CartScreen.route();
      case CatalogScreen.routeName:
        return CatalogScreen.route(category: settings.arguments as Category);
      case ProductScreen.routeName:
        return ProductScreen.route(product: settings.arguments as Product);
      case WishlistScreen.routeName:
        return WishlistScreen.route();
      case CheckoutScreen.routeName:
        return CheckoutScreen.route();
      case OrderConfirmation.routeName:
        return OrderConfirmation.route();

      default:
        return _errorRoute();
    }
  }
  static Route _errorRoute(){
    return MaterialPageRoute(
      settings: RouteSettings(name: '/error'),
        builder: (_) => Scaffold(
          appBar: AppBar(
            title: Text('Error'),
          ),
        ));
  }
}