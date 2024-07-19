import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:auto_mentorx/components/custom_surfix_icon.dart';
import 'package:auto_mentorx/components/form_error.dart';
import 'package:auto_mentorx/helper/keyboard.dart';
import 'package:auto_mentorx/screens/forgot_password/forgot_password_screen.dart';

import '../../../components/coustom_bottom_nav_bar.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  const SignForm({super.key});

  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  bool? remember = false;
  final List<String?> errors = [];
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              const Text("Remember me"),
              const Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: const Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            press: () async {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();

                try {
                  await _auth.signInWithEmailAndPassword(
                      email: _controllerEmail.text,
                      password: _controllerPassword.text);
                    QuerySnapshot<Map<String, dynamic>> data = await _fireStore
                        .collection('User')
                        .get();
                    if (mounted) {
                      ProfileDetailsModel profileDetailsModel =
                      ProfileDetailsModel(
                          id: data.docs.first.id,
                          email: data.docs.first['Email'],
                          password: data.docs.first['Password'],
                          phoneNumber: data.docs.first['PhoneNumber'],
                          address: data.docs.first['address'],
                          imageUrl: data.docs.first['imgUrl'],
                          userName: data.docs.first['userName']);
                      Navigator.pushNamed(context, CustomBottomNavBar.routName,
                          arguments: {
                            'type': '',
                            'email': _controllerEmail.text,
                            'password': _controllerPassword.text,
                            'ProfileDetailsModel': profileDetailsModel
                          });
                    }


                } catch (e) {
                  if (e is FirebaseAuthException) {
                    if (e.code.contains('invalid-credential')) {}
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Wrong Email or Password'),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: const Text('OK'))
                            ],
                          );
                        });
                  }else{
                    print(e.toString());
                  }
                }
                // if all are valid then go to success screen
                KeyboardUtil.hideKeyboard(context);
              }
            },
          ),
        ],
      ),
    );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      controller: _controllerPassword,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      controller: _controllerEmail,
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}

class ProfileDetailsModel {
  final String id;
  final String email;
  final String password;
  final String phoneNumber;
  final String address;
  final String imageUrl;
  final String userName;

  ProfileDetailsModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.address,
      required this.imageUrl,
      required this.userName});
}
