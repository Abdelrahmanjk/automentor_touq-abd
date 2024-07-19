import 'dart:io';
import 'package:auto_mentorx/screens/sign_in/components/sign_form.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';

class ProfilePic extends StatefulWidget {
  const ProfilePic({
    super.key,
    required this.profileDetailsModel,
  });

  final ProfileDetailsModel profileDetailsModel;

  @override
  State<ProfilePic> createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  File? _selectImage;
  final _fireStore = FirebaseFirestore.instance;

  Future<void> pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      _selectImage = File(image!.path);
    });
    await _fireStore
        .collection('User')
        .doc(widget.profileDetailsModel.id)
        .update({'imgUrl': image!.path});
  }

  @override
  void initState() {
    if (widget.profileDetailsModel.imageUrl.isNotEmpty) {
      _selectImage = File(widget.profileDetailsModel.imageUrl);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 115,
      width: 115,
      child: Stack(
        fit: StackFit.expand,
        clipBehavior: Clip.none,
        children: [
          if (_selectImage != null) ...[
            CircleAvatar(
              backgroundImage: FileImage(_selectImage!),
            ),
          ] else ...[
            const CircleAvatar(
              backgroundImage: AssetImage('assets/images/Unknown_person.jpg'),
            ),
          ],
          Positioned(
            right: -16,
            bottom: 0,
            child: SizedBox(
              height: 46,
              width: 46,
              child: TextButton(
                style: TextButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                    side: BorderSide(color: Colors.white),
                  ),
                  primary: Colors.white,
                  backgroundColor: Color(0xFFF5F6F9),
                ),
                onPressed: () async {
                  await pickImageFromGallery();
                },
                child: SvgPicture.asset("assets/icons/Camera Icon.svg"),
              ),
            ),
          )
        ],
      ),
    );
  }
}
