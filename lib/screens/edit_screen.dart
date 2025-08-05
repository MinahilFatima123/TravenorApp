import 'package:flutter/material.dart';
import 'package:travelapp/widgets/custom_appbar.dart';
import '../widgets/custom_textformfield.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});
  @override
  State<EditProfileScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditProfileScreen> {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController locationCntroller = TextEditingController();
  final TextEditingController mobileNoController = TextEditingController();
  File? imageFile;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        imageFile = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    //final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CustomAppBar(
        title: 'Edit Profile',
        trailing: TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            foregroundColor: Theme.of(context).primaryColor,
          ),
          child: const Text(
            'Done',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
          child: Column(
            //  mainAxisAlignment: MainAxisAlignment.start,
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
                  'Leonardo',
                  style: Theme.of(
                    context,
                  ).textTheme.displaySmall!.copyWith(fontSize: 24),
                  textAlign: TextAlign.center,
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () {
                    _pickImage();
                  },
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
              Text(
                'First Name',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your First Name',
                controller: firstNameController,
                keyboardType: TextInputType.name,

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 16 / 812),
              Text(
                'Last Name',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your Last Name',
                controller: lastNameController,
                keyboardType: TextInputType.name,

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 16 / 812),
              Text(
                'Location',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: 'Enter your Location',
                controller: locationCntroller,
                keyboardType: TextInputType.name,

                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

              SizedBox(height: screenHeight * 16 / 812),
              Text(
                'Mobile Number',
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
                textAlign: TextAlign.start,
              ),
              SizedBox(height: screenHeight * 12 / 812),
              CustomTextFormField(
                hintText: '01758-000666',
                controller: mobileNoController,
                keyboardType: TextInputType.number,
                prefixIcon: Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      showModalBottomSheet(
                        context: context,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(16),
                          ),
                        ),
                        builder: (context) => SizedBox(
                          height: 250,
                          width: 150,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, top: 12),
                            child: ListView(
                              children: const [
                                Text('+88', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 10),
                                Text('+99', style: TextStyle(fontSize: 16)),
                                SizedBox(height: 10),
                                Text('+101', style: TextStyle(fontSize: 16)),
                              ],
                            ),
                          ),
                        ),
                      );
                    },

                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          '+88',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                          ),
                        ),
                        const Icon(
                          Icons.arrow_drop_down,
                          size: 20,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
                suffixIcon: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Icon(
                    Icons.check,
                    size: 20,
                    color: Theme.of(context).primaryColor,
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
