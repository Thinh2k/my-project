import 'package:flutter/material.dart';
import 'package:shopfood/screens/login/firebase_user.dart';
import 'package:shopfood/screens/login/register_screen.dart';


class LoginScreen extends StatelessWidget {
  static const String routeName = '/login';
  static Route route(){
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => LoginScreen());
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  Widget build(BuildContext context) {

    bool _onShowPass = false;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text("Chào mừng bạn đã đến với",
                  style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: Colors.blue),),
              ),
              Center(
                child: Text("Green Food",
                  style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: Colors.blue),),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('greenfoodvietnam-2.png',
                    alignment: Alignment.center),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Nhập email để đăng nhập",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: TextField(
                      controller: passwordController,
                      decoration: InputDecoration(
                          hintText: "Nhập mật khẩu để đăng nhập",
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      ),
                      obscureText: true,
                    ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20, left: 70),
                child: TextButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                    },
                    child: Text("Bạn chưa có tài khoản, đăng ký tại đây!!!")),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () async {
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      service.loginUser(context, emailController.text, passwordController.text);
                    }else{
                      service.errorBox(context, "Sai Email hoặc mật khẩu, vui lòng nhập lại!!!");
                    }
                  },
                  child: Text("Đăng nhập")),
            ],
          ),),
      ),
    );
  }

}

