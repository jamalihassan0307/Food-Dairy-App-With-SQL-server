// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names
import 'dart:convert';

class UserModel {
  String username;
  String id;

  String email;
  String phone;
  String dob;
  String image;
  String password;
  UserModel({
    required this.username,
    required this.id,
    required this.email,
    required this.phone,
    required this.dob,
    required this.image,
    required this.password,
  });

  
String toMap() {
    return "'$id','$username','$email','$password','$phone','$dob','$image'";
  
  }

 factory UserModel. fromMap(Map<String ,dynamic> map) {
    return UserModel( 

      username: map['username'],
      id: map['id'] ,
      email: map['email'] ,
      phone: map['phone'] ,
      dob: map['dob'] ,
      image: map['image'],
      password: map['password'] ,
    );
  }


  @override
  String toString() {
    return 'UserModel(username: $username, id: $id, email: $email, phone: $phone, dob: $dob, image: $image, password: $password)';
  }
}
