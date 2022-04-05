import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopfood/screens/home/home_screen.dart';
import 'package:shopfood/widgets/custom_appbar.dart';


class UserForm extends StatefulWidget {
  static const String routeName = '/userform';
  static Route route() {
    return MaterialPageRoute(
        settings: RouteSettings(name: routeName),
        builder: (_) => UserForm());
  }
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _dobController = TextEditingController();
  TextEditingController _genderController = TextEditingController();
  TextEditingController _ageController = TextEditingController();
  List<String> gender = ["Name", "Nữ"];

  Future<void> _selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime(DateTime.now().year - 20),
      firstDate: DateTime(DateTime.now().year - 30),
      lastDate: DateTime(DateTime.now().year),
    );
    if (picked != null)
      setState(() {
        _dobController.text = "${picked.day}/ ${picked.month}/ ${picked.year}";
      });
  }

  sendUserDataToDB()async{

    final FirebaseAuth _auth = FirebaseAuth.instance;
    var  currentUser = _auth.currentUser;

    CollectionReference _collectionRef = FirebaseFirestore.instance.collection("profile_user");
    return _collectionRef.doc(currentUser!.email).set({
      "Tên":_nameController.text,
      "Sđt":_phoneController.text,
      "Ngày sinh":_dobController.text,
      "Giới tính":_genderController.text,
      "Tuổi":_ageController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()))).catchError((error)=>print("something is wrong. $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Thông tin người dùng'),
        body: SafeArea(
          child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20,
                ),
                Center(
                  child: Text(
                    "Gửi biểu mẫu để tiếp tục.",
                    style:
                    TextStyle(fontSize: 20, color: Colors.green),
                  ),
                ),
                Center(
                  child: Text(
                    "Chúng tôi sẽ không chia sẻ thông tin của bạn với bất kỳ ai.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.green,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                myTextField("Nhập tên: ",TextInputType.text,_nameController),
                myTextField("Nhập số điện thoại: ",TextInputType.number,_phoneController),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Nhập ngày sinh: ",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDateFromPicker(context),
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                Row(
                  children: [
                    Text('Giới tính: '),
                    TextField(
                      controller: _genderController,
                      readOnly: true,
                      decoration: InputDecoration(
                        hintText: "",
                        prefixIcon: DropdownButton<String>(
                          items: gender.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: new Text(value),
                              onTap: () {
                                setState(() {
                                  _genderController.text = value;
                                });
                              },
                            );
                          }).toList(),
                          onChanged: (_) {},
                        ),
                      ),
                    ),
                  ],
                ),
                myTextField("Nhập số tuổi",TextInputType.number,_ageController),
                SizedBox(
                  height: 50,
                ),
                // elevated button
                customButton("Tiếp tục",()=>sendUserDataToDB()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget myTextField(String hintText,keyBoardType,controller){
  return TextField(
    keyboardType: keyBoardType,
    controller: controller,
    decoration: InputDecoration(hintText: hintText),
  );
}
Widget customButton (String buttonText,onPressed){
  return Padding(
      padding: const EdgeInsets.all(25.0),
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white, fontSize: 18),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.orange,
          elevation: 3,
        ),
      ),
  );
}