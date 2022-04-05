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
  TextEditingController _addressController = TextEditingController();
  List<String> gender = ["Nam", "Nữ"];

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
      "name":_nameController.text,
      "phone":_phoneController.text,
      "dob":_dobController.text,
      "gender":_genderController.text,
      "address":_addressController.text,
    }).then((value) => Navigator.push(context, MaterialPageRoute(builder: (_)=>HomeScreen()))).catchError((error)=>print("Có lỗi xảy ra $error"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    TextStyle(fontSize: 22, color: Colors.deepOrange),
                  ),
                ),
                Center(
                  child: Text(
                    "Chúng tôi không chia sẻ thông tin của bạn với bất kỳ ai.",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepOrange,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                myTextField("Nhập họ và tên",TextInputType.text,_nameController),
                myTextField("Nhập số điện thoại",TextInputType.number,_phoneController),
                TextField(
                  controller: _dobController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Chọn ngày sinh",
                    suffixIcon: IconButton(
                      onPressed: () => _selectDateFromPicker(context),
                      icon: Icon(Icons.calendar_today_outlined),
                    ),
                  ),
                ),
                TextField(
                  controller: _genderController,
                  readOnly: true,
                  decoration: InputDecoration(
                    hintText: "Chọn giới tính",
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
                myTextField("Nhập địa chỉ",TextInputType.text,_addressController),

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
  return Center(
    child: SizedBox(
        width: 100,
        height: 56,
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
      ),
  );
}