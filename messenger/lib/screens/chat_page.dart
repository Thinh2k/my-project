import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:messenger/firebaseHelper.dart';
import 'package:messenger/navbar.dart';
import 'package:messenger/screens/showMessages.dart';
import 'package:shared_preferences/shared_preferences.dart';

var loginUser = FirebaseAuth.instance.currentUser;

class ChatPage extends StatefulWidget {

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  Service service = Service();

  final storeMessage = FirebaseFirestore.instance;
  final auth = FirebaseAuth.instance;
  TextEditingController msg = TextEditingController();

getCurrentUser(){
  final user = auth.currentUser;
  if(user!=null){
    loginUser = user;
  }
}

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: Center(
          child: Text("Messages"),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              height: 500,
              child: SingleChildScrollView(
                physics: ScrollPhysics(),
                reverse: true,
                  child: ShowMessages())),
          Row(
            children: [
              Expanded(child: Container(
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.blue, width: 0.2)
                  )
                ),
                child: TextField(
                  controller: msg,
                  decoration: InputDecoration(hintText: "   Enter Massage..."),
                ),
              )),
              IconButton(onPressed: (){
                if(msg.text.isNotEmpty){
                  storeMessage.collection("Messages").doc().set({
                    "messages":msg.text.trim(),
                    "user":loginUser!.email.toString(),
                    "time": DateTime.now(),
                  });
                  msg.clear();
                }
                },
                  icon: Icon(Icons.send,
                  color: Colors.teal,
          )),
        ],
      )],
    ));
  }
}

