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

  Future<void> updatedata(context) async {
    if (username.text.isNotEmpty &&
        email.text.isNotEmpty &&
        password.text.isNotEmpty &&
        phone.text.isNotEmpty &&
        dob.text.isNotEmpty) {
      try {
        UserModel model = UserModel(
          password: password.text,
          image: StaticData.model!.image,
          username: username.text,
          id: StaticData.model!.id,
          email: email.text,
          phone: phone.text,
          dob: dob.text,
        );

        await SQL.Update("""
          UPDATE users 
          SET email = '${model.email}',
              password = '${model.password}',
              username = '${model.username}',
              phone = '${model.phone}',
              dob = '${model.dob}'
          WHERE id = '${StaticData.model!.id}'
        """);

        StaticData.model = model;
        update();

        Fluttertoast.showToast(
          msg: "Update data Successfully!",
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
      } catch (e) {
        print("Error updating profile: $e");
        Fluttertoast.showToast(
          msg: "An error occurred. Please try again!",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
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

  initialize() {
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
