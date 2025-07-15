import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:virualapi/constants/config.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/datasource/user_datasource.dart';
import 'package:virualapi/models/login.dart';
import 'package:virualapi/models/user.dart';
import 'package:virualapi/repos/user_repo.dart';
import 'package:virualapi/services/app_preferences.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class ProfileSettingsPage extends StatelessWidget {
  final ProfileController controller = Get.find<ProfileController>();

  void _showImagePickerOptions(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo_library),
              title: Text("Pick from Gallery"),
              onTap: () {
                Navigator.pop(context);
                controller.pickImage(ImageSource.gallery);
              },
            ),
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text("Take a Photo"),
              onTap: () {
                Navigator.pop(context);
                controller.pickImage(ImageSource.camera);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormBuilderState>();
    return Scaffold(
      body: SafeArea(
        child: Obx(() => Column(
              children: [
                SizedBox(height: 20),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: Icon(Icons.chevron_left,
                            size: 32, color: Colors.black),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Center(
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey[300],
                                backgroundImage: controller
                                                .userImageFile.value !=
                                            null &&
                                        controller.userImageFile.value!.path
                                            .isNotEmpty
                                    ? FileImage(controller.userImageFile.value!)
                                    : (controller.profileImagePath.value !=
                                                null &&
                                            controller.profileImagePath.value!
                                                .isNotEmpty
                                        ? NetworkImage(
                                            controller.profileImagePath.value!)
                                        : AssetImage(
                                                'assets/images/profile2.png')
                                            as ImageProvider),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.green,
                                  radius: 16,
                                  child: IconButton(
                                    iconSize: 16,
                                    icon: Icon(Icons.edit, size: 16),
                                    color: Colors.white,
                                    onPressed: () {
                                      _showImagePickerOptions(context);
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Profile Picture",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 10),
                        FormBuilder(
                          key: formKey,
                          initialValue: {
                            'name': controller.name.value,
                            'email': controller.email.value,
                            'phone': controller.phone.value,
                            'address': controller.address.value,
                            'city': controller.city.value,
                            'zip': controller.zipcode.value,
                          },
                          child: Column(
                            children: [
                              _buildTextField('name', 'Name',
                                  initialValue: controller.name.value),
                              _buildTextField(
                                'email',
                                'Email',
                                initialValue: controller.email.value,
                                validators: [
                                  FormBuilderValidators.required(),
                                  FormBuilderValidators.email(),
                                ],
                              ),
                              _buildTextField('phone', 'Contact Number',
                                  initialValue: controller.phone.value,
                                  keyboard: TextInputType.phone),
                              _buildTextField('address', 'Address',
                                  initialValue: controller.address.value),
                              Row(
                                children: [
                                  Expanded(
                                      child: _buildTextField('city', 'City')),
                                  SizedBox(width: 10),
                                  Expanded(
                                      child: _buildTextField('zip', 'Zip Code',
                                          keyboard: TextInputType.number)),
                                ],
                              ),
                              SizedBox(height: 20),
                              Button(
                                isLoading: controller.isBusy.value,
                                height: 55,
                                title: "Update Profile",
                                onPressed: () =>
                                    controller.updateProfile(formKey),
                                backgroundColor: DARK_BG_COLOR,
                              ),
                              SizedBox(height: 20),
                              Text.rich(
                                TextSpan(
                                  text: 'Need help? ',
                                  children: [
                                    TextSpan(
                                      text: 'Contact Support',
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }

  Widget _buildTextField(
    String name,
    String label, {
    bool obscure = false,
    String? initialValue,
    List<String? Function(String?)>? validators,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        decoration: BoxDecoration(
          color: const Color(0xffEBEFEF),
          borderRadius: BorderRadius.circular(30),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: FormBuilderTextField(
          name: name,
          initialValue: initialValue,
          obscureText: obscure,
          keyboardType: keyboard,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            labelText: label,
            labelStyle: const TextStyle(fontSize: 15),
            border: InputBorder.none,
          ),
          validator: validators != null
              ? FormBuilderValidators.compose(validators)
              : null,
        ),
      ),
    );
  }
}
