import 'package:flutter/material.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';
class InformationScreen extends StatelessWidget {
  static const String routeName = '/information';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => InformationScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(title: 'Thông tin cửa hàng',),
      bottomNavigationBar: CustomNavbar(screen: routeName),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: Text('Cửa hàng Green Food',
                  style: Theme.of(context).textTheme.headline2!.copyWith(color: Colors.green)),
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.add_location),
                    SizedBox(width: 10),
                    Text('Nguyễn Huệ, Phường 5, Tuy Hòa, Phú Yên',
                    style: Theme.of(context).textTheme.headline4),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.phone),
                    SizedBox(width: 10),
                    Text('Sđt: 0346693347',
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.email),
                    SizedBox(width: 10),
                    Text('Email: thinhotaku@gmail.com',
                        style: Theme.of(context).textTheme.headline4),
                  ],
                ),
                Divider(thickness: 2),
                Row(
                  children: [
                    SizedBox(width: 5),
                    Icon(Icons.public),
                    SizedBox(width: 10),
                    Text('https://greenfood.com.vn/',
                        style: Theme.of(context).textTheme.headline4!.copyWith(color: Colors.blue)),
                  ],
                ),
                SizedBox(height: 20),
                Divider(thickness: 2),
                Positioned(
                    child: Image.asset('greenfood.jpg')),
              ],
            ),
        ],
        ),
      ),
    );
  }
}
