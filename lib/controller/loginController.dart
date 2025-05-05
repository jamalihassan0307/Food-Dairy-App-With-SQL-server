// ignore_for_file: file_names, avoid_print

import 'package:fluttertoast/fluttertoast.dart';
import 'package:food_dairy_app/sql/sql.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:food_dairy_app/model.dart/UserModel.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> getUser(String email, String password) async {
    try {
      List<Map<String, dynamic>> result = await SQL.get(
          "SELECT * FROM users WHERE email = '$email' AND password = '$password'");

      if (result.isNotEmpty) {
        UserModel model = UserModel(
          username: result[0]['username'],
          id: result[0]['id'],
          email: result[0]['email'],
          phone: result[0]['phone'],
          dob: result[0]['dob'],
          image: result[0]['image'],
          password: result[0]['password'],
        );

        StaticData.model = model;
        StaticData.id = model.id;
        update();
        StaticData.storeCredentials(email, password);
        cleardata();
      } else {
        Fluttertoast.showToast(
          msg: "User Not Found !",
          backgroundColor: Colors.red,
          textColor: Colors.white,
          gravity: ToastGravity.BOTTOM,
          fontSize: 17,
          timeInSecForIosWeb: 1,
          toastLength: Toast.LENGTH_LONG,
        );
      }
    } catch (e) {
      print("Error in login: $e");
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
  }

  cleardata() {
    email.clear();
    password.clear();
    update();
  }

  // Future<UserModel?> UpdateUser(String email, String password, context) async {
  //   print("dataaaa");
  //    String query = "UPDATE dbo.users SET ";
  //     query += "email = '$email'";
  //     query += "password = '$password'";

  //     query += " WHERE id = '${StaticData.model!.id}'";
    
  //       await SQL.Update(query);

  //       StaticData.model!.email=email;
  //       StaticData.model!.password=password;
  //   return null;
  // }
}
