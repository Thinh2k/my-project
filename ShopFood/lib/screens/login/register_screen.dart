import 'package:flutter/material.dart';
import 'package:shopfood/screens/login/firebase_user.dart';
import 'package:shopfood/screens/login/login_screen.dart';


class RegisterScreen extends StatelessWidget {
  static const String routeName = '/register';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => RegisterScreen());
  }
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Service service = Service();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Trang đăng ký",
                style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: Colors.blue),),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Image.asset('greenfoodvietnam-2.png',
                    alignment: Alignment.centerRight),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Nhập email để đăng ký",
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
                      hintText: "Nhập mật khẩu để đăng ký",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20, left: 80),
                child: TextButton(onPressed: ()
                {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                },
                    child: Text("Đã có tài khoản, đăng nhập tại đây!!!")),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () async {
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      service.createUser(context, emailController.text, passwordController.text);

                    }else{
                      service.errorBox(context, "Có lỗi về email hoặc mật khẩu");
                    }

                  },
                  child: Text("Đăng ký")),
            ],
          ),),
      ),
    );
  }
}

