import 'package:flutter/material.dart';
import 'package:messenger/firebaseHelper.dart';
import 'package:messenger/screens/chat_page.dart';
import 'package:messenger/screens/register_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatelessWidget {

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
              Text("Login Page",
                style: TextStyle(fontSize: 25 , fontWeight: FontWeight.bold, color: Colors.blue),),
              Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Image.asset('message.jpg',
                  alignment: Alignment.center),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      hintText: "Enter Your Email",
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
                      hintText: "Enter Your Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)
                      )
                  ),
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10,bottom: 20, left: 250),
                child: TextButton(
                    onPressed: ()
                    {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text(" I don't have any account?")),
              ),
              ElevatedButton(
                  style: TextButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 50)),
                  onPressed: () async {
                    SharedPreferences pref = await SharedPreferences.getInstance();
                    if(emailController.text.isNotEmpty && passwordController.text.isNotEmpty){
                      service.loginUser(context, emailController.text, passwordController.text);
                      pref.setString("email", emailController.text);
                    }else{
                      service.errorBox(context, "Fields must not empty please provide valid email and password");
                    }
                  },
                  child: Text("Login")),
            ],
          ),),
      ),
    );
  }
}

