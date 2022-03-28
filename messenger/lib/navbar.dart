import 'dart:html';

import 'package:flutter/material.dart';
import 'package:messenger/firebaseHelper.dart';
import 'package:messenger/screens/chat_page.dart';
import 'package:messenger/screens/list_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Service service = Service();
    return Drawer(
      child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: Text(loginUser!.email.toString()),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.asset('add.jpg'),
                  ),
                ),
              ),
            ListTile(
                leading: Icon(Icons.account_circle),
                iconColor: Colors.blue,
                title: Text('User'),
                textColor: Colors.blue,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => ListUser()));
                }
            ),
            ListTile(
                leading: Icon(Icons.logout),
                iconColor: Colors.black,
                title: Text('Log Out',),
                textColor: Colors.black,
                onTap: () async {
                  service.signOut(context);
                  SharedPreferences pref = await SharedPreferences.getInstance();
                  pref.remove("email");
                }
            ),
          ]),
    );
  }
}
