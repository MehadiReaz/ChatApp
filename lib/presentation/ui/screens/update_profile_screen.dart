import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chatapp/data/apis.dart';
import 'package:chatapp/data/models/user_model.dart';
import 'package:chatapp/presentation/ui/screens/auth/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';

class UpdateProfileScreen extends StatefulWidget {
  const UpdateProfileScreen({super.key, required this.user});
  final Users user;
  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  String? image;

  picImageFromGallery() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? gallery =
        await imagePicker.pickImage(source: ImageSource.gallery);
    if (gallery != null) {
      image = gallery.path;
      setState(() {});
      Apis.updateProfilePicture(File(image!));
    }
  }

  picImageFromCamera() async {
    final ImagePicker imagePicker = ImagePicker();
    final XFile? camera =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (camera != null) {
      image = camera.path;
      setState(() {});
      Apis.updateProfilePicture(File(image!));
    }
  }

  profileUpdate() {
    Apis.updateSelfUserInfo();
    Get.showSnackbar(GetSnackBar(
      duration: Duration(seconds: 2),
      backgroundColor: Colors.green,
      title: 'Success!',
      messageText: Text('Profile Upadted successfully'),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        title: Text(
          'Profile',
          textAlign: TextAlign.end,
        ),
      ),
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                  ),
                  Stack(
                    children: [
                      image != null
                          ? ClipRRect(
                              borderRadius: BorderRadius.circular(110),
                              child: Image.file(
                                  height: 200, fit: BoxFit.cover, File(image!)),
                            )
                          : ClipRRect(
                              borderRadius: BorderRadius.circular(110),
                              child: CachedNetworkImage(
                                height: 200,
                                fit: BoxFit.cover,
                                imageUrl: widget.user.image!,
                                placeholder: (context, url) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Icon(Icons.error),
                              ),
                            ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: MaterialButton(
                            shape: CircleBorder(),
                            color: Colors.white,
                            onPressed: () {
                              _showBottomSheet();
                            },
                            child: Icon(
                              Icons.edit,
                              color: Colors.black,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    Apis.user.email!,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    onSaved: (newValue) => Apis.selfUser?.name = newValue,
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : 'Please Enter Name',
                    //controller: nameTEController,
                    initialValue: widget.user.name,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person),
                        label: Text('Name'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    onSaved: (newValue) => Apis.selfUser?.about = newValue,
                    validator: (value) => value != null && value.isNotEmpty
                        ? null
                        : 'Please Enter Name',
                    initialValue: widget.user.about,
                    //controller: aboutTEController,
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.info_outline),
                        label: Text('About'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 50),
                        backgroundColor: Colors.blueAccent.shade700,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                        profileUpdate();
                      }
                    },
                    child: Text(
                      'Update',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.redAccent,
        foregroundColor: Colors.white,
        onPressed: () async {
          await FirebaseAuth.instance.signOut();
          await GoogleSignIn().signOut();
          Get.offAll(() => LoginScreen());
        },
        label: Text(
          'Logout',
        ),
        icon: Icon(Icons.logout_outlined),
      ),
    );
  }

  void _showBottomSheet() {
    Get.bottomSheet(
        Container(
          child: Wrap(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(20),
                child: ListView(shrinkWrap: true, children: [
                  Text(
                    'Select Photo',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: () {
                          picImageFromCamera();
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.camera_alt,
                              size: 80,
                            ),
                            Text('Camera'),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () async {
                          picImageFromGallery();
                        },
                        icon: Column(
                          children: [
                            Icon(
                              Icons.photo_library,
                              size: 80,
                            ),
                            Text('Gallery'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ]),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white);
  }
}
