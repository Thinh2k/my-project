import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/widgets/custom_appbar.dart';
class ProfileScreen extends StatelessWidget {
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProfileScreen());
  }
  @override
  Widget build(BuildContext context) {

    TextEditingController ?_nameController;
    TextEditingController ?_phoneController;
    TextEditingController ?_ageController;


    updateData(){
      CollectionReference _collectionRef = FirebaseFirestore.instance.collection("profile_user");
      return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update(
          {
            "Tên": _nameController!.text,
            "Sđt": _phoneController!.text,
            "Tuổi": _ageController!.text,
          }).then((value) => print("Cập nhật thành công"));

    }
    setDataToTextFiled(data){
      return Column(
        children: [
          TextFormField(
            controller: _nameController = TextEditingController(text: data['Tên']),
          ),
          TextFormField(
            controller: _phoneController = TextEditingController(text: data['Sđt']),
          ),
          TextFormField(
            controller: _ageController = TextEditingController(text: data['Tuổi']),
          ),
          ElevatedButton(
              onPressed: ()  => updateData(),
              child: Text("Cập nhật",
                  style: Theme.of(context).textTheme.headline3))
        ],
      );
    }

    return Scaffold(
      appBar: CustomAppBar(title: 'Cập nhật'),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25.0),
          child: StreamBuilder(
            stream: FirebaseFirestore.instance.collection("profile_user")
                .doc(FirebaseAuth.instance.currentUser!.email).snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              var data = snapshot.data;
              if(data==null){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return setDataToTextFiled(data);
            },
          ),
        ),
      ),
    );
  }
}
