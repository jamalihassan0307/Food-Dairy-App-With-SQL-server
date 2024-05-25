import 'dart:io';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/sql/sql.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:food_dairy_app/screen/home_screen.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileController extends GetxController {
  static ProfileController get to => Get.find();
  TextEditingController username =
      TextEditingController(text: StaticData.model!.username);
  TextEditingController email =
      TextEditingController(text: StaticData.model!.email);
  TextEditingController password =
      TextEditingController(text: StaticData.model!.password);
  TextEditingController phone =
      TextEditingController(text: StaticData.model!.phone);
  TextEditingController dob =
      TextEditingController(text: StaticData.model!.dob);
  File? image;
  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = File(pickedImage.path);
      update();
    }
  }

  updatedata(context) async {
    // image  ??= await StaticData.assetToFile(StaticData.model!.image);
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        // image != null &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      UserModel model = UserModel(
        password: password.text,
        image: StaticData.model!.image,
        username: username.text,
        id: StaticData.model!.id,
        email: email.text,
        phone: phone.text,
        dob: dob.text,
      );
      print("asdfgh $model");
  
     
      String query = "UPDATE dbo.users SET ";
      query += "email = '${model.email}'";
      query += "password = '${model.password}'";
      // query += "image = '${model.image}'";
      query += "username = '${model.username}'";
      query += "phone = '${model.phone}'";
      query += "dob = '${model.dob}'";

      query += " WHERE id = '${StaticData.model!.id}'";
      print('User updated successfully');
    
      await SQL.Update(query);
      StaticData.model=model;
      update();
      Fluttertoast.showToast(
        msg: "Update data Successfuly !",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
        (route) => true,
      );

      // clearField();
    } else {
      Fluttertoast.showToast(
        msg: "Please fill all fields!",
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM,
        fontSize: 17,
        timeInSecForIosWeb: 1,
        toastLength: Toast.LENGTH_LONG,
      );
    }
  }

  initialize(){
      username =
      TextEditingController(text: StaticData.model!.username);
   email =
      TextEditingController(text: StaticData.model!.email);
   password =
      TextEditingController(text: StaticData.model!.password);
   phone =
      TextEditingController(text: StaticData.model!.phone);
   dob =
      TextEditingController(text: StaticData.model!.dob);
      
  }

  void clearField() {
    username.clear();
    email.clear();
    password.clear();
    phone.clear();
    dob.clear();
    image = null;
    update();
  }
}
