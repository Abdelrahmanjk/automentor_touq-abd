import 'package:auto_mentorx/screens/sign_in/components/sign_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  static String routeName = "/edit_profile";

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _auth = FirebaseAuth.instance;
  final _fireStore = FirebaseFirestore.instance;
  late ProfileDetailsModel profileDetailsModel;
  List<TextEditingController> controllers = [];

  @override
  void didChangeDependencies() {
    Map<String, ProfileDetailsModel> dataRoute = ModalRoute.of(context)!
        .settings
        .arguments as Map<String, ProfileDetailsModel>;
    profileDetailsModel = dataRoute['profileDetailsModel']!;
    List.generate(5,
        (index) => controllers.add(TextEditingController(text: prof(index))));
    super.didChangeDependencies();
  }

  String prof(int index) {
    switch (index) {
      case 0:
        return profileDetailsModel.email;
      case 1:
        return profileDetailsModel.password;
      case 2:
        return profileDetailsModel.userName;
      case 3:
        return profileDetailsModel.phoneNumber;
      case 4:
        return profileDetailsModel.address;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profile'),
      ),
      body: Column(children: [
        Column(
          children: List.generate(controllers.length, (index) {
            return TextFormField(
              controller: controllers[index],
            );
          }),
        ),
        ElevatedButton(
            onPressed: () async {
              try {
                controllers[0].text.contains(profileDetailsModel.email)
                    ? null
                    : await updateEmail();
                controllers[1].text.contains(profileDetailsModel.password)
                    ? null
                    : await updatePassword();
                controllers[2].text.contains(profileDetailsModel.userName)
                ?null
                :await updateUsername();
                controllers[3].text.contains(profileDetailsModel.phoneNumber)
                ?null
                :await updatePhoneNumber();
                controllers[4].text.contains(profileDetailsModel.address)
                ?null
                :updateAddress();
                if (mounted) {
                  _auth.signOut();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/sign_in', (route) => false);
                }
              } catch (e) {
                print('=======$e=============');
              }
            },
            child: Text('Save'))
      ]),
    );
  }

  Future<void> updateEmail() async {
    try {
      AuthCredential authCredential = EmailAuthProvider.credential(
          email: profileDetailsModel.email, password: profileDetailsModel.password);
      await _auth.currentUser?.reauthenticateWithCredential(authCredential);
      await _auth.currentUser?.updateEmail(controllers[0].text);
      _fireStore
          .collection('User')
          .doc(profileDetailsModel.id)
          .update({'Email': controllers[0]});
    } catch (e) {
      if (e is FirebaseAuthException) {
        print(e.code);
      } else {
        print('================${e.toString()}');
      }
    }
  }

  Future<void> updatePassword() async {
    try{
      AuthCredential authCredential = EmailAuthProvider.credential(
          email: profileDetailsModel.email, password: profileDetailsModel.password);
      await _auth.currentUser?.reauthenticateWithCredential(authCredential);
      await _auth.currentUser?.updatePassword(controllers[1].text);
      _fireStore
          .collection('User')
          .doc(profileDetailsModel.id)
          .update({'Password': controllers[1].text});
    }catch(e){
      if(e is FirebaseAuthException){
        print(e.code);
      }
    }
  }
  Future<void> updateUsername() async {
    try{
      _fireStore
          .collection('User')
          .doc(profileDetailsModel.id)
          .update({'userName': controllers[2].text});
    }catch(e){
      if(e is FirebaseAuthException){
        print(e.code);
      }
    }
  }
  Future<void> updatePhoneNumber() async {
    try{
      _fireStore
          .collection('User')
          .doc(profileDetailsModel.id)
          .update({'PhoneNumber': controllers[3].text});
    }catch(e){
      if(e is FirebaseAuthException){
        print(e.code);
      }
    }
  }
  Future<void> updateAddress() async {
    try{
      _fireStore
          .collection('User')
          .doc(profileDetailsModel.id)
          .update({'address': controllers[4].text});
    }catch(e){
      if(e is FirebaseAuthException){
        print(e.code);
      }
    }
  }
}
