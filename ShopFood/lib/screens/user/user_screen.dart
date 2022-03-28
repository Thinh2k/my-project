
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/screens/information/information_screen.dart';
import 'package:shopfood/screens/login/firebase_user.dart';
import 'package:shopfood/screens/login/login_screen.dart';

import '../../widgets/custom_appbar.dart';
import '../../widgets/custom_navbar.dart';


var loginUser = FirebaseAuth.instance.currentUser;

class UserScreen extends StatelessWidget {

  static const String routeName = '/user';

  final auth = FirebaseAuth.instance;

  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => UserScreen());
  }
getCurrentUser(){
  final user = auth.currentUser;
  if(user!=null){
    loginUser = user;
  }
}
@override
  void initState() {
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {


    Service service = Service();

    return Scaffold(
      appBar: CustomAppBar(title: 'NGƯỜI DÙNG'),
      bottomNavigationBar: CustomNavbar(screen: routeName),
      body: ListView(
          children: [
            Column(
              children: [
                  Center(
                    child: UserAccountsDrawerHeader(
                      accountName: null,
                      accountEmail: Text(loginUser!.email.toString(),
                      style: Theme.of(context).textTheme.headline3),
                      currentAccountPicture: CircleAvatar(
                            child: ClipOval(
                                  child: Image.asset('greenfoodvietnam-2.png')),
                            ),
                            ),
                  ),
                ],
            ),
            ListTile(
                leading: Icon(Icons.assignment_ind),
                iconColor: Colors.black,
                title: Text('Thông tin cửa hàng',),
                textColor: Colors.black,
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.push(context, MaterialPageRoute(builder: (context) => InformationScreen()));
                }
            ),
              ListTile(
                  leading: Icon(Icons.logout),
                  iconColor: Colors.black,
                  title: Text('Đăng xuất',),
                  textColor: Colors.black,
                  onTap: () async {
                    await FirebaseAuth.instance.signOut();
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  }
            ),
          ],
        ),
    );
  }
}