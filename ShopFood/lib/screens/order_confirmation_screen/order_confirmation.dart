import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/checkout/checkout_bloc.dart';
import 'package:shopfood/blocs/product/product_bloc.dart';
import 'package:shopfood/models/models.dart';
import 'package:shopfood/widgets/order_summary.dart';
import 'package:shopfood/widgets/order_summary_product_card.dart';

import '../../blocs/cart/cart_bloc.dart';
import '../../widgets/cart_product_card.dart';
import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
class OrderConfirmation extends StatelessWidget {
  static const String routeName = '/order-confirmation';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => OrderConfirmation());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'HÓA ĐƠN',),
        bottomNavigationBar: CustomNavbar(screen: routeName),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                Container(
                  color: Colors.green,
                  width: double.infinity,
                  height: 170,
                ),
                Positioned(
                  left: 100,
                    child: Image.asset('greenfoodvietnam-2.png')),
                Positioned(
                  top: 140,
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  child: Text('Chúc mừng bạn đã đặt hàng thành công',
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline3!.copyWith(color: Colors.yellowAccent),),
                )
              ],),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text('Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi',
                          style: Theme.of(context).textTheme.headline4),
                      SizedBox(height: 20),
                      Divider(thickness: 2),
                      Text('Tổng chi phí: ',
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(height: 10),
                      OrderSummary(),
                    ],
              ),),
            ],
          ),
        ),
    );
    }
}
