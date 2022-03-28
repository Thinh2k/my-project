import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/category/category_bloc.dart';
import 'package:shopfood/blocs/product/product_bloc.dart';
import 'package:shopfood/models/category_model.dart';
import 'package:shopfood/models/models.dart';
import 'package:shopfood/widgets/custom_appbar.dart';
import 'package:shopfood/widgets/custom_navbar.dart';
import 'package:shopfood/widgets/hero_carousel_card.dart';
import 'package:shopfood/widgets/product_card.dart';
import 'package:shopfood/widgets/section_title.dart';

import '../../widgets/product_carousel.dart';
class HomeScreen extends StatelessWidget {
  static const String routeName = '/home';
  static Route route(){
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
        builder: (_) => HomeScreen());
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar(title: 'GREEN FOOD',),
      bottomNavigationBar: CustomNavbar(screen: routeName),
      body: Column(
        children: [
          BlocBuilder <CategoryBloc, CategoryState>(
            builder: (context, state) {
              if(state is CategoryLoading){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if(state is CategoryLoaded){
                return CarouselSlider(
                  options: CarouselOptions(
                    aspectRatio: 1.2,
                    viewportFraction: 0.9,
                    enlargeCenterPage: true,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    autoPlay: true,
                  ),
                  items: state.categories.map((category) => HeroCarouselCard(category: category)).toList(),
                );
              }
              else{
                return Text('Đã xảy ra sự cố');
              }
            }),
          Column(
            children: [
              SectionTitle(title: 'Sản phẩm Hot'),
              Row(
                children: [
                  BlocBuilder <ProductBloc, ProductState>(
                      builder: (context, state) {
                        print('Current checkout state: ${state.runtimeType.toString()}');
                        // if (state is ProductLoading) {
                        //   return Center(
                        //     child: CircularProgressIndicator(),
                        //   );
                        // }
                        if (state is ProductLoaded) {
                          return ProductCarousel(
                              products: state.products
                                  .where((product) =>
                              product
                                  .isRecommended)
                                  .toList());
                        }
                        else {
                          return Text('Đã xảy ra sự cố');
                        }
                      }
                  ),
                ],
              ),
              SectionTitle(title: 'Sản phẩm phổ biến'),
              Row(
                children: [
                  BlocBuilder <ProductBloc, ProductState>(
                      builder: (context, state) {
                        print('Current checkout state: ${state.runtimeType.toString()}');
                        // if (state is ProductLoading) {
                        //   return Center(
                        //     child: CircularProgressIndicator(),
                        //   );
                        // }
                        if (state is ProductLoaded) {
                          return ProductCarousel(
                              products: state.products
                                  .where((product) => product
                                  .isPopular)
                                  .toList());
                        }
                        else {
                          return Text('Đã xảy ra sự cố');
                        }
                      }
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}



