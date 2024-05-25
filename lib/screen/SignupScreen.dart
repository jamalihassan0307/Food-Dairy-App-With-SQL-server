// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:food_dairy_app/controller/signupController.dart';
import 'package:get/get.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  void initState() {
    Get.put(SignupController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: GetBuilder<SignupController>(initState: (state) {
        Get.put(SignupController());
      }, builder: (obj) {
        return Container(
            height: height,
            width: width,
            color: Colors.black,
            child: Center(
              child: SizedBox(
                height: height,
                width: width * 0.9,
                child: ListView(children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.west,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.02),
                  const Text(
                    "Sign up free account",
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w800,
                        color: Colors.white),
                  ),
                  SizedBox(height: height * 0.02),
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
                  SizedBox(height: height * 0.02),
                  Center(
                    child: InkWell(
                      onTap: () {
                        obj.register(context);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40)),
                        shadowColor: Colors.black,
                        elevation: 10,
                        child: Container(
                          height: height * 0.07,
                          width: width * 0.4,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: const Color.fromARGB(255, 138, 11, 160),
                          ),
                          child: const Center(
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: height * 0.03),
                  const Column(
                    children: [
                      Text(
                        "By clicking Sign up you agree to the",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            " following ",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.white),
                          ),
                          Text(
                            "terms and Conditions",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Color.fromARGB(255, 241, 21, 5)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ]),
              ),
            ));
      }),
    );
  }
}
