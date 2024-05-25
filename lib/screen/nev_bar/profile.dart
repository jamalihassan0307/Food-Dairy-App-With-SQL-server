// ignore_for_file: unused_local_variable

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/profileController.dart';
import 'package:food_dairy_app/widget/constants/staticdata.dart';
import 'package:get/get.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    Get.put(ProfileController());
    ProfileController.to.initialize();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: GetBuilder<ProfileController>(builder: (obj) {
        return SizedBox(
          height: height,
          width: width,
          child: Center(
            child: SizedBox(
              height: height,
              width: width * 0.9,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Text(
                      "Profile Update ",
                      maxLines: 2,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    CircleAvatar(
                      radius: 80,
                      backgroundImage: obj.image == null
                          ? FileImage(File(StaticData.model!.image))
                          : FileImage(
                              File(obj.image!.path),
                            ),
                      // child: InkWell(
                      //   onTap: () {
                      //     obj.pickImage();
                      //   },
                      //   child: const Align(
                      //     alignment: Alignment.bottomRight,
                      //     child: CircleAvatar(
                      //       child: Icon(Icons.add),
                      //     ),
                      //   ),
                      // ),
                    ),
                    SizedBox(
                      height: height * 0.05,
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      // shape: CircleBorder(),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.07,
                        child: TextFormField(
                          controller: obj.username,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "  Username",
                            contentPadding: EdgeInsets.only(left: 10),
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      // shape: CircleBorder(),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.07,
                        child: TextFormField(
                          controller: obj.password,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "  Password",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      // shape: CircleBorder(),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.07,
                        child: TextFormField(
                          controller: obj.phone,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: "  Phone",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      // shape: CircleBorder(),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.07,
                        child: TextFormField(
                          controller: obj.dob,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10),
                            hintText: "  Date of birth",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: height * 0.01),
                    Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40)),
                      shadowColor: Colors.black,
                      // shape: CircleBorder(),
                      elevation: 10,
                      child: SizedBox(
                        height: height * 0.07,
                        child: TextFormField(
                          controller: obj.email,
                          cursorColor: Colors.white,
                          cursorRadius: const Radius.circular(10),
                          cursorHeight: 30,
                          style: const TextStyle(fontSize: 20),
                          decoration: const InputDecoration(
                            contentPadding: EdgeInsets.only(left: 10),
                            border: InputBorder.none,
                            hintText: "  Email",
                            filled: false,
                            hintStyle: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          obj.updatedata(context);
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          shadowColor: Colors.black,
                          elevation: 10,
                          child: Container(
                            height: height * 0.07,
                            width: width * 0.45,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              color: const Color.fromARGB(255, 138, 11, 160),
                            ),
                            child: const Center(
                              child: Text(
                                "Update",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 27,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
