
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/screens/login/login_screen.dart';
import 'package:shopfood/screens/profile/profile_screen.dart';
import 'package:shopfood/screens/profile/user_profile.dart';

class Service{
  final auth = FirebaseAuth.instance;

  void createUser(context, email, password) async {
    try{
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) =>
      {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => UserForm()))
      });
    } catch(e) {
      errorBox(context, 'Email hoặc mật khẩu không phù hợp!!! Vui lòng nhập lại');
    }
  }

  void loginUser(context, email, password) async {
    try{

      await auth.signInWithEmailAndPassword(email: email, password: password).then((value) =>
      {
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen())),
      });
    } catch(e) {
      errorBox(context, 'Sai Email hoặc mật khẩu!!! Vui lòng nhập lại!!!');
    }
  }

  void signOut(context) async {
    try{
      await auth.signOut().then((value) => {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context)=> LoginScreen()),
                (route) => false)
      });
    } catch(e) {
      errorBox(context,e);
    }
  }
  void errorBox(context, e){
    showDialog(
        context: context,
        builder: (context){
          return AlertDialog(
            title: Center(child: Text("Đã xảy ra lỗi: ",
                style: Theme.of(context).textTheme.headline3)),
            content: Text(e.toString()),
          );
        });
  }

}