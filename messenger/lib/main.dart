import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messenger/screens/chat_page.dart';
import 'package:messenger/screens/login_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'config/config.dart';

final Configurations configurations = Configurations();
Future <void> main() async {


  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          appId: '1:710585039974:android:62b8940c234d845f4141a7',
          messagingSenderId: '710585039974',
          apiKey: 'AIzaSyC2PpbmDHPx8C2VnqVossR6kKVmINJLiAo',
          projectId: 'messenger-aac8f'
      )
  );
  SharedPreferences pref = await SharedPreferences.getInstance();

  var email = pref.getString("email");
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null?LoginPage():ChatPage(),
  ));
}