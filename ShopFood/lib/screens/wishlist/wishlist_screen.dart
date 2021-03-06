import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopfood/widgets/custom_appbar.dart';
import 'package:shopfood/widgets/custom_navbar.dart';
import '../../widgets/product_card.dart';
class WishlistScreen extends StatelessWidget {
  static const String routeName = '/wishlist';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => WishlistScreen());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(title: 'SP YÊU THÍCH'),
      bottomNavigationBar: CustomNavbar(screen: routeName),
      body: BlocBuilder<WishlistBloc, WishlistState>(
        builder: (context, state) {
          if(state is WishlistLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
            if(state is WishlistLoaded){
              return GridView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 16.0),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      childAspectRatio: 2.4),
                  itemCount: state.wishlist.products.length,
                  itemBuilder: (BuildContext context, int index){
                    return Center(
                        child: ProductCard(
                          product: state.wishlist.products[index],
                          widthFactor: 1.1,
                          leftPosition: 100,
                          isWishlist: true,)
                    );
                  },
                  );
              }
              else {
                return Text('Đã xảy ra sự cố');
              }
              },
      )

    );
  }

}