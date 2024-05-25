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
  Future getUser(String email, String password) async {
    print("dataaaa");
   try {
     await SQL.get("Select * from users where email = '$email' AND password = '$password'").then((map) async {
    
   
   
      UserModel? model;
      try {
          print("84965784$map");
          if (map[0]!=null) {
                 
       model =await UserModel( 

      username: map[0]['username'],
      id: map[0]['id'] as String ,
      email: map[0]['email'] as String ,
      phone: map[0]['phone'] as String ,
      dob: map[0]['dob']  as String,
      image: map[0]['image'] as String,
      password: map[0]['password']  as String,
    );
  
    print("sofjnsngfg$model");
      print("dskjfhj$model");
      StaticData.model = model;
      StaticData.id = model.id;
      update();
      StaticData.storeCredentials(email, password);
      cleardata();  
 }
 else{
  Fluttertoast.showToast(msg: "User Not Found !",backgroundColor: Colors.red,textColor: Colors.white,gravity: ToastGravity.BOTTOM,fontSize: 17,timeInSecForIosWeb: 1,toastLength: Toast.LENGTH_LONG,);
  
 }
      } catch (e) {
        print("edfrergj$e");
      } 
    
      
  });
   } catch (e) {
     print("fdsgndfjgh$e");
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
