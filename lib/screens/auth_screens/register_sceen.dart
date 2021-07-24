import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:katchymemes/screens/auth_screens/login_screen.dart';
import 'package:katchymemes/screens/home.dart';
import 'package:katchymemes/utils/contants/api_constants.dart';
import 'package:http/http.dart' as http;
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:katchymemes/blocs/auth/auth_bloc.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  bool isPasswordSeen = false;
  bool isFormActive = false;

  checkRegistrationFormActive() {
    if (_usernameController.text != "" &&
        _emailController.text != "" &&
        _passwordController.text.length > 8 &&
        _confirmPasswordController.text == _passwordController.text) {
      setState(() {
        isFormActive = true;
      });
      registerUser(_usernameController.text, _emailController.text,
          _passwordController.text);
    }
  }

  registerUser(
    String username,
    String email,
    String password,
  ) async {
    var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.registerUrl);
    var response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/x-www-form-urlencoded"
        },
        body: {
          "key": ApiConstants.apiKey,
          "username": username,
          "password": password,
          "email": email,
        },
        encoding: Encoding.getByName("utf-8"));

    if (response.statusCode == 200) {
      // Navigator.of(this.context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (BuildContext context) => Home()),
      //     (Route<dynamic> route) => false);
      print("${response.body}");
    } else {
      print(response.body);
    }
  }

  @override
  Widget build(BuildContext context) {
    // return BlocConsumer<AuthBloc, AuthState>(
    //     listener: (context, state) {},
    //     builder: (context, state) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Sign Up",
            style: TextStyle(color: Color(0xff0d0d0d)),
          ),
          leading: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Icon(
              Icons.arrow_back_ios,
              size: 20,
              color: Color(0xff0d0d0d),
            ),
          ),
          centerTitle: true,
          backgroundColor: Color(0xfffafafa),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 42,
                ),
                Text(
                  "Create Account",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Username"),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10)),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Email"),
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _passwordController,
                          obscureText: isPasswordSeen,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordSeen = !isPasswordSeen;
                            });
                          },
                          icon: Icon(
                            (isPasswordSeen) ? EvaIcons.eye : EvaIcons.eyeOff,
                            color: Color(0xffa1a1a1),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14),
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xfff1f1f1),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _confirmPasswordController,
                          obscureText: isPasswordSeen,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Confirm Password",
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(6),
                    color: (isFormActive) ? Colors.pink : Color(0xffbfbfbf),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    onPressed: () {
                      // if (isFormActive) {
                      //   BlocProvider.of<AuthBloc>(context)
                      //     ..add(RegisterBeginEvent(
                      //         email: _emailController.text,
                      //         password: _passwordController.text));
                      // }
                      checkRegistrationFormActive();
                    },
                    child: Text(
                      "Sign Up",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
                SizedBox(
                  height: 18,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (BuildContext context) {
                              return LoginScreen();
                            }));
                          },
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(fontSize: 16),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Already have an account? ",
                                    style: TextStyle(color: Color(0xffa1a1a1))),
                                TextSpan(
                                    text: "Sign In",
                                    style: TextStyle(color: Color(0xff0d0d0d)))
                              ])),
                        ),
                        SizedBox(
                          height: 18,
                        ),
                        Text(
                          "OR",
                          style:
                              TextStyle(fontSize: 16, color: Color(0xffa1a1a1)),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(6),
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    onPressed: () {},
                    child: Text(
                      "Connect with Google",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    )),
              ],
            ),
          ),
        ));
    //});
  }
}
