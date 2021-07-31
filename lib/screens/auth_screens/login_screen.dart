import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:katchymemes/blocs/auth/auth_bloc.dart';
import 'package:katchymemes/models/login_model.dart';
import 'package:katchymemes/screens/auth_screens/register_sceen.dart';
import 'package:katchymemes/screens/home.dart';
import 'package:http/http.dart' as http;
import 'package:katchymemes/utils/contants/api_constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = new TextEditingController();
  bool isLoading = false;
  final passwordController = new TextEditingController();

  loginUser(String username, String password) async {
    setState(() {
      isLoading = true;
    });
    // try {
    var url = Uri.parse(ApiConstants.baseUrl +
        ApiConstants.loginUrl +
        "user=$username&password=$password&key=${ApiConstants.apiKey}");
    var apiKey = ApiConstants.apiKey;
    print(url.toString());
    // setState(() {
    //   isLoading = false;
    // });
    // return null;
    var response = await http.get(url);
    Map result = jsonDecode(response.body);
    print(result);

    if (result["success"]["message"] == "success") {
      addUser(Login(apiKey, username));
      Navigator.of(this.context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (BuildContext context) => Home()),
          (Route<dynamic> route) => false);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text(
          "Login Failed",
          style: TextStyle(color: Colors.red),
        ),
        backgroundColor: Colors.black,
      ));
      print(response.body);
    }
    // } catch (e) {
    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    //     content: Text(
    //       "Login Failed",
    //       style: TextStyle(color: Colors.red),
    //     ),
    //     backgroundColor: Colors.black,
    //   ));
    // }

    setState(() {
      isLoading = false;
    });
  }

  void addUser(Login login) {
    var box = Hive.box('login');
    box.put(login.apikey, login.username);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Sign In",
          style: TextStyle(color: Color(0xff0d0d0d)),
        ),
        centerTitle: true,
        backgroundColor: Color(0xfffafafa),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
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
                  "Welcome Back!",
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.w900),
                ),
                Text(
                  "You've been missed.",
                  style: TextStyle(color: Color(0xffa1a1a1), fontSize: 18),
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
                    controller: usernameController,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: passwordController,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Password",
                          ),
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                      Icon(
                        Icons.remove_red_eye_outlined,
                        color: Color(0xffa1a1a1),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 14,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Forget Password?",
                      style: TextStyle(fontSize: 16, color: Color(0xffa1a1a1)),
                    )
                  ],
                ),
                SizedBox(
                  height: 32,
                ),
                MaterialButton(
                    minWidth: double.infinity,
                    height: 50,
                    padding: EdgeInsets.all(6),
                    color: Colors.pink,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                    onPressed: () {
                      if (!isLoading) {
                        loginUser(
                            usernameController.text, passwordController.text);
                      }
                    },
                    child: (!isLoading)
                        ? Text(
                            "Login",
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          )
                        : CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 1,
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
                              return BlocProvider(
                                create: (context) => AuthBloc(),
                                child: RegisterScreen(),
                              );
                            }));
                          },
                          child: RichText(
                              text: TextSpan(
                                  style: TextStyle(fontSize: 16),
                                  children: <TextSpan>[
                                TextSpan(
                                    text: "Don't have an account? ",
                                    style: TextStyle(color: Color(0xffa1a1a1))),
                                TextSpan(
                                    text: "Sign Up",
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
        ),
      ),
    );
  }
}
