import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopfood/blocs/checkout/checkout_bloc.dart';
import 'package:shopfood/widgets/widgets.dart';

class CheckoutScreen extends StatelessWidget {
  static const String routeName = '/checkout';

  static Route route() {
    return MaterialPageRoute(
      settings: RouteSettings(name: routeName),
      builder: (context) => CheckoutScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'THANH TOÁN'),
      bottomNavigationBar: CustomNavbar(screen: routeName),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocBuilder<CheckoutBloc, CheckoutState>(
          builder: (context, state) {
            print('Current checkout state: ${state.runtimeType.toString()}');
            // if (state is CheckoutLoading) {
            //   return Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            if (state is CheckoutLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Thông tin khách hàng',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(email: value));
                  }, context, 'Email'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(fullName: value));
                  }, context, 'Họ tên'),
                  SizedBox(height: 10),
                  Text(
                    'Địa chỉ',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(address: value));
                  }, context, 'Địa chỉ'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(telephone: value));
                  }, context, 'SĐT'),
                  _buildTextFormField((value) {
                    context
                        .read<CheckoutBloc>()
                        .add(UpdateCheckout(zipCode: value));
                  }, context, 'Mã sale'),
                  // SizedBox(height: 20),
                  // Container(
                  //   width: MediaQuery.of(context).size.width,
                  //   height: 60,
                  //   alignment: Alignment.bottomCenter,
                  //   decoration: BoxDecoration(color: Colors.green),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                  //     children: [
                  //       Center(
                  //         child: Text(
                  //           'SELECT A PAYMENT METHOD',
                  //           style: Theme.of(context)
                  //               .textTheme
                  //               .headline3!
                  //               .copyWith(color: Colors.white),
                  //         ),
                  //       ),
                  //       IconButton(
                  //         onPressed: () {},
                  //         icon: Icon(
                  //           Icons.arrow_forward,
                  //           color: Colors.white,
                  //         ),
                  //       )
                  //     ],
                  //   ),
                  // ),
                  SizedBox(height: 10),
                  Text(
                    'Đặt hàng',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  OrderSummary(),
                ],
              );
            } else {
              return Text('Đã xảy ra sự cố');
            }
          },
        ),
      ),
    );
  }

  Padding _buildTextFormField(
      Function(String)? onChanged,
      BuildContext context,
      String labelText,
      ) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Row(
        children: [
          SizedBox(
            width: 75,
            child: Text(
              labelText,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
          Expanded(
            child: TextFormField(
              onChanged: onChanged,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: const EdgeInsets.only(left: 10),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}