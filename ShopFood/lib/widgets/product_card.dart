import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/cart/cart_bloc.dart';
import 'package:shopfood/blocs/product/product_bloc.dart';
import 'package:shopfood/blocs/wishlist/wishlist_bloc.dart';
import 'package:shopfood/models/product_model.dart';
class ProductCard extends StatelessWidget {
  final Product product;
  final double widthFactor;
  final double leftPosition;
  final bool isWishlist;

  const ProductCard({Key? key,
    required this.product,
    this.widthFactor = 2.5,
    this.leftPosition = 5,
    this.isWishlist = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double widthValue = MediaQuery.of(context).size.width / widthFactor;

    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, '/product',
        arguments: product);
      },
      child: Stack(
          children: [
            Container(
              width: widthValue,
              height: 150,
              child: Image.network(product.imageUrl,
                fit: BoxFit.cover,),
            ),
            Positioned(
                top: 60,
                left: leftPosition,
                child: Container(
                  width: widthValue - 5 - leftPosition,
                  height: 80,
                  alignment: Alignment.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.black.withAlpha(50)
                  ),)),
            Positioned(
              top: 65,
              left: leftPosition + 5,
              child: Container(
                alignment: Alignment.bottomCenter,
                width: widthValue - 10 - leftPosition,
                height: 70,
                decoration: BoxDecoration(
                  color: Colors.blueGrey,
                ),
                child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style:
                              Theme.of(context).textTheme.headline5!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '${product.price}\đ',
                              style:
                              Theme.of(context).textTheme.headline6!.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        BlocBuilder <CartBloc, CartState>(
                          builder: (context, state) {
                            if(state is CartLoading){
                              return Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            if(state is CartLoaded){
                              return Expanded(
                                child: IconButton(
                                    onPressed: (){
                                      final snackBar = SnackBar(content: Text('Đã thêm vào giỏ hàng'),
                                      );
                                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                      context.read<CartBloc>().add(AddProduct(product));
                                    },
                                    icon: Icon(Icons.add_circle, color: Colors.white)),
                              );
                            } else {
                              return Text('Đã xảy ra sự cố');
                            }
                          }),
                        isWishlist
                            ? Expanded(
                                child: IconButton(
                                  icon: Icon(Icons.delete,
                                  color: Colors.white,),
                                  onPressed: () {
                                    final snackBar = SnackBar(
                                        content: Text('Đã xóa sản phẩm yêu thích!'));
                                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                                    context.read<WishlistBloc>().add(RemoveProductFromWishList(product));
                                  },
                                ),
                            ) : SizedBox(),
                      ],
                    )
                ),
              ),
            ),
          ]),
    );
  }
}
