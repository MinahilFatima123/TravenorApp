import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_appbar.dart';
import '../widgets/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../services/fetch_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_model.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationController = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  File? imageFile;

  @override
  void initState() {
    super.initState();
    firstNameController.text = AppData.firstName ?? '';
    lastNameController.text = AppData.lastName ?? '';
    locationController.text = AppData.location ?? '';
    mobileNoController.text = AppData.mobileNo ?? '';

  }

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  Future<void> _saveProfile() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    print('Current user UID: $uid');

    if (uid == null) return;

    try {
      await FirebaseFirestore.instance.collection('users').doc(uid).update({
        'firstName': firstNameController.text.trim(),
        'lastName': lastNameController.text.trim(),
        'location': locationController.text.trim(),
        'mobileNo': mobileNoController.text.trim(),
      });

      AppData.setUserData(
        name: AppData.name ?? '',
        email: AppData.email ?? '',
        firstName: firstNameController.text.trim(),
        lastName: lastNameController.text.trim(),
        location: locationController.text.trim(),
        mobileNo: mobileNoController.text.trim(),
      );

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Success'),
          content: const Text('Profile updated successfully.'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    } catch (e) {

      if (!mounted) return;
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Error'),
          content: Text('Failed to update profile: $e'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        actions: [
          TextButton(
            onPressed: _saveProfile,
            style: TextButton.styleFrom(
              foregroundColor: Theme.of(context).primaryColor,
            ),
            child: const Text(
              'Done',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 48,
                  backgroundImage: imageFile != null
                      ? FileImage(imageFile!)
                      : const AssetImage('assets/png/profile_image.png')
                  as ImageProvider,
                  backgroundColor: Colors.transparent,
                ),
              ),
              SizedBox(height: screenHeight * 0.0099),
              Center(
                child: Text(
                  AppData.name ?? '',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall!
                      .copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: _pickImage,
                  child: Text(
                    'Change Profile Picture',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).primaryColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 30 / 812),

              // First Name
              Text(
                'First Name',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your First Name',
                controller: firstNameController,
                keyboardType: TextInputType.name,
              ),

              SizedBox(height: screenHeight * 16 / 812),

              // Last Name
              Text(
                'Last Name',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your Last Name',
                controller: lastNameController,
                keyboardType: TextInputType.name,
              ),

              SizedBox(height: screenHeight * 16 / 812),

              // Location
              Text(
                'Location',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your Location',
                controller: locationController,
                keyboardType: TextInputType.name,
              ),

              SizedBox(height: screenHeight * 16 / 812),

              // Mobile Number
              Text(
                'Mobile Number',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: '01758-000666',
                controller: mobileNoController,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Text(
                        '+92',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 20,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}