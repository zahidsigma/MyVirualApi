import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // HEADER ROW (fixed)
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 30, horizontal: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon:
                        Icon(Icons.chevron_left, size: 32, color: Colors.black),
                  ),
                  GestureDetector(
                    onTap: () =>
                        controller.homeKey.currentState!.openEndDrawer(),
                    child: ReusableWidget.loadSvg("assets/icons/munuapi.svg"),
                  ),
                ],
              ),
            ),

            // BODY (scrollable part)
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
                            backgroundImage: NetworkImage(
                                "https://media.istockphoto.com/id/1142003969/photo/close-up-profile-of-handsome-young-black-man-against-isolated-white-background.jpg?s=612x612&w=0&k=20&c=_bBDiZcxzTdEm_nV8ckM2IJkKUK-TIwXCeE1Dt2KEWA="),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 16,
                              child: IconButton(
                                iconSize: 16,
                                icon: Icon(Icons.edit),
                                color: Colors.white,
                                onPressed: () {},
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Text("Harris Siderakis",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    Text("Harris_siderakis@icloud.com",
                        style: TextStyle(color: Colors.grey)),
                    SizedBox(height: 20),

                    // FORM
                    FormBuilder(
                      key: _formKey,
                      child: Column(
                        children: [
                          _buildTextField('name', 'Name'),
                          _buildTextField('email', 'Email',
                              validators: [FormBuilderValidators.email()]),
                          _buildTextField('contact', 'Contact Number',
                              keyboard: TextInputType.phone),
                          _buildTextField('address', 'Address'),
                          Row(
                            children: [
                              Expanded(child: _buildTextField('city', 'City')),
                              SizedBox(width: 10),
                              Expanded(
                                  child: _buildTextField('zip', 'Zip Code',
                                      keyboard: TextInputType.number)),
                            ],
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.black,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              padding: EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 40),
                            ),
                            onPressed: () {
                              if (_formKey.currentState?.saveAndValidate() ??
                                  false) {
                                final formData = _formKey.currentState?.value;
                                print("Submitted: $formData");
                              } else {
                                print("Validation failed");
                              }
                            },
                            child: Text("Update Setting",
                                style: TextStyle(color: Colors.white)),
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
        ),
      ),
    );
  }

  Widget _buildTextField(
    String name,
    String label, {
    bool obscure = false,
    List<String? Function(String?)>? validators,
    TextInputType keyboard = TextInputType.text,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xffEBEFEF),
          borderRadius: BorderRadius.circular(30), // rounded corners
        ),
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: FormBuilderTextField(
          name: name,
          obscureText: obscure,
          keyboardType: keyboard,
          decoration: InputDecoration(
            labelText: label,
            labelStyle: TextStyle(fontSize: 12),
            border: InputBorder.none, // no visible border
          ),
          validator: FormBuilderValidators.compose(validators ??
              [
                FormBuilderValidators.required(),
              ]),
        ),
      ),
    );
  }
}
