import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/screens/user/user_screen.dart';
import 'package:shopfood/widgets/custom_appbar.dart';
class ProfileScreen extends StatefulWidget {
  static const String routeName = '/profile';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => ProfileScreen());
  }
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController ?_nameController;
  TextEditingController ?_phoneController;
  TextEditingController ?_addressController;


  setDataToTextField(data) {
    return Column(
      children: [
        TextFormField(
          controller:
          _nameController = TextEditingController(text: data['name']),
        ),
        TextFormField(
          controller:
          _phoneController = TextEditingController(text: data['phone']),
        ),
        TextFormField(
          controller: _addressController = TextEditingController(text: data['address']),
        ),
        ElevatedButton(onPressed: () => updateData(), child: Text("Cập nhật"))
      ],
    );
  }

  updateData() {
    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("profile_user");
    return _collectionRef.doc(FirebaseAuth.instance.currentUser!.email).update(
        {
          "name": _nameController!.text,
          "phone": _phoneController!.text,
          "address": _addressController!.text,
        }
    ).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>UserScreen()))).catchError((error)=>print("Có lỗi xảy ra. $error"));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("profile_user").doc(
              FirebaseAuth.instance.currentUser!.email).snapshots(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            var data = snapshot.data;
            if (data == null) {
              return Center(child: CircularProgressIndicator(),);
            }
            return setDataToTextField(data);
          },

        ),
      )),
    );
  }
}
