import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:virualapi/Animation/my_slide_transition.dart';
import 'package:virualapi/Animation/myfade.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/support/contact_us_coroller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/text_field.dart';

class Support extends StatefulWidget {
  const Support({super.key});

  @override
  State<Support> createState() => _SupportState();
}

class _SupportState extends State<Support> {
  int selectedTabIndex = 0;
  final ContactUsController controller = Get.isRegistered<ContactUsController>()
      ? Get.find<ContactUsController>()
      : Get.put(ContactUsController(miscRepository: Get.find()));

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: 'Help & ',
      subtitle: 'Support',
      istitle: true,
      body: Column(
        children: [
          // Custom Tab Buttons
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('FAQs', 0),
                _buildTabButton('Contact Us', 1),
                _buildTabButton('Troubleshooting', 2),
              ],
            ),
          ),
          // Dynamic Screen Content
          Expanded(
            child: _buildScreenContent(),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton(String label, int index) {
    final isSelected = selectedTabIndex == index;
    return ElevatedButton(
      onPressed: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected ? Colors.black : Colors.grey[300],
        foregroundColor: isSelected ? Colors.white : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(fontSize: 12),
      ),
    );
  }

  Widget _buildScreenContent() {
    switch (selectedTabIndex) {
      case 0:
        return _buildFAQs();
      case 1:
        return _buildContactUs(controller);
      case 2:
        return _buildTroubleshooting();
      default:
        return const SizedBox();
    }
  }

  // Individual content for each screen
  Widget _buildFAQs() {
    return ListView(
      children: [
        _buildFAQTile('How do I reset my password?',
            'Click on "Forgot Password" on the login screen.'),
        _buildFAQTile('Can I update my email?',
            'Go to account settings to update your details.'),
      ],
    );
  }

  // Widget _buildContactUs() {
  //   return Center(
  //       child: Padding(
  //     padding: const EdgeInsets.all(12.0),
  //     child: SingleChildScrollView(
  //       child: Obx(
  //         () => Column(
  //           mainAxisAlignment: MainAxisAlignment.start,
  //           children: [
  //             // Icon(Icons.contact_mail, size: 100, color: Colors.blue),
  //             // SizedBox(height: 16),
  //             // Text('For support, email us at: support@example.com'),
  //             AppTextField(
  //               name: 'name',
  //               showTitle: false,
  //               title: "Username",
  //               rectangleborder: false,
  //               placeholder: "Name",
  //               validator: FormBuilderValidators.compose(([
  //                 FormBuilderValidators.required(),
  //               ])),
  //             ),
  //             AppSpacerH(10),
  //             AppTextField(
  //               name: 'email',
  //               showTitle: false,
  //               title: "Username",
  //               rectangleborder: false,
  //               placeholder: "Email",
  //               validator: FormBuilderValidators.compose(([
  //                 FormBuilderValidators.required(),
  //               ])),
  //             ),
  //             AppSpacerH(10),
  //             AppTextField(
  //               name: 'phone',
  //               showTitle: false,
  //               title: "Username",
  //               rectangleborder: false,
  //               placeholder: "Phone",
  //               validator: FormBuilderValidators.compose(([
  //                 FormBuilderValidators.required(),
  //               ])),
  //             ),
  //             AppSpacerH(10),
  //             AppTextField(
  //               name: 'message',
  //               showTitle: false,
  //               maxline: 10,
  //               title: "Message",
  //               rectangleborder: false,
  //               placeholder: "Message",
  //               validator: FormBuilderValidators.compose(([
  //                 FormBuilderValidators.required(),
  //               ])),
  //             ),
  //             AppSpacerH(20),
  //             Button(
  //               // isLoading: controller.isBusy.value,
  //               height: 55,
  //               width: getScreenWidth(context) * 0.9,
  //               title: "Sent Message",
  //               onPressed: () {
  //                 // if (controller.formKey.currentState
  //                 //         ?.saveAndValidate() ??
  //                 //     false) {
  //                 //   final formValues =
  //                 //       controller.formKey.currentState!.value;
  //                 //   final username = formValues['username'];
  //                 //   final password = formValues['password'];

  //                 //   // Print username and password to the terminal
  //                 //   debugPrint("Username: $username");
  //                 //   debugPrint("Password: $password");

  //                 // Call the login method or perform your logic here
  //                 // controller.onLogin();
  //                 // } else {
  //                 //   debugPrint("Form validation failed");
  //                 // }
  //               },
  //               backgroundColor: COLOR_PRIMARY,
  //             ),
  //             AppSpacerH(30),
  //             Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Container(
  //                   height: 1,
  //                   width: getScreenWidth(context) / 3,
  //                   color: Colors.grey,
  //                 ),
  //                 Text(
  //                   'Support',
  //                   style: TextStyle(
  //                     fontSize: 20,
  //                     color: Colors.grey,
  //                   ),
  //                 ),
  //                 Container(
  //                   height: 1,
  //                   width: getScreenWidth(context) / 3,
  //                   color: Colors.grey,
  //                 )
  //               ],
  //             ),
  //             AppSpacerH(20),
  //           ],
  //         ),
  //       ),
  //     ),
  //   ));
  // }
  // Widget _buildContactUs() {
  //   return Center(
  //     child: Padding(
  //       padding: const EdgeInsets.all(12.0),
  //       child: SingleChildScrollView(
  //         child: FormBuilder(
  //           key: controller.formKey,
  //           child: Obx(() => Column(
  //                 children: [
  //                   AppTextField(
  //                     name: 'name',
  //                     placeholder: 'Name',
  //                     showTitle: false,
  //                     validator: FormBuilderValidators.compose([
  //                       FormBuilderValidators.required(),
  //                     ]),
  //                   ),
  //                   AppSpacerH(10),
  //                   AppTextField(
  //                     name: 'email',
  //                     placeholder: 'Email',
  //                     showTitle: false,
  //                     validator: FormBuilderValidators.compose([
  //                       FormBuilderValidators.required(),
  //                       FormBuilderValidators.email(),
  //                     ]),
  //                   ),
  //                   AppSpacerH(10),
  //                   AppTextField(
  //                     name: 'phone',
  //                     placeholder: 'Phone',
  //                     showTitle: false,
  //                     validator: FormBuilderValidators.required(),
  //                   ),
  //                   AppSpacerH(10),
  //                   AppTextField(
  //                     name: 'message',
  //                     placeholder: 'Message',
  //                     showTitle: false,
  //                     maxline: 8,
  //                     validator: FormBuilderValidators.required(),
  //                   ),
  //                   AppSpacerH(20),

  //                   /// Show error message if available
  //                   // if (contactUsController.errorMessage.isNotEmpty)
  //                   //   Text(
  //                   //     contactUsController.errorMessage.value,
  //                   //     style: TextStyle(color: Colors.red),
  //                   //   ),

  //                   // /// Show success message if available
  //                   // if (contactUsController.successMessage.isNotEmpty)
  //                   //   Text(
  //                   //     contactUsController.successMessage.value,
  //                   //     style: TextStyle(color: Colors.green),
  //                   //   ),

  //                   AppSpacerH(10),

  //                   Button(
  //                     title: 'Send Message',
  //                     isLoading: controller.isBusy.value,
  //                     onPressed: controller.contacUS,
  //                     height: 55,
  //                     width: getScreenWidth(context) * 0.9,
  //                     backgroundColor: COLOR_PRIMARY,
  //                   ),
  //                   AppSpacerH(10),
  //                   Row(
  //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                     children: [
  //                       Container(
  //                         height: 1,
  //                         width: getScreenWidth(context) / 3,
  //                         color: Colors.grey,
  //                       ),
  //                       Text(
  //                         'Support',
  //                         style: TextStyle(
  //                           fontSize: 20,
  //                           color: Colors.grey,
  //                         ),
  //                       ),
  //                       Container(
  //                         height: 1,
  //                         width: getScreenWidth(context) / 3,
  //                         color: Colors.grey,
  //                       )
  //                     ],
  //                   ),
  //                 ],
  //               )),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget _buildContactUs(ContactUsController controller) {
    return Obx(() {
      if (!controller.showForm.value) {
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 60),
              SizedBox(height: 10),
              Text(
                controller.successMessage.value,
                style: TextStyle(fontSize: 18, color: Colors.green),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: controller.resetForm,
              //   child: Text('Send Another Message'),
              // ),
              Button(
                title: 'Send Message',
                isLoading: controller.isBusy.value,
                onPressed: controller.resetForm,
                height: 55,
                width: Get.width * 0.9,
                backgroundColor: COLOR_PRIMARY,
              ),
            ],
          ),
        );
      }

      return Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                AppTextField(
                  name: 'name',
                  placeholder: 'Name',
                  showTitle: false,
                  validator: FormBuilderValidators.required(),
                ),
                AppSpacerH(10),
                AppTextField(
                  name: 'email',
                  placeholder: 'Email',
                  showTitle: false,
                  validator: FormBuilderValidators.compose([
                    FormBuilderValidators.required(),
                    FormBuilderValidators.email(),
                  ]),
                ),
                AppSpacerH(10),
                AppTextField(
                  name: 'phone',
                  placeholder: 'Phone',
                  showTitle: false,
                  validator: FormBuilderValidators.required(),
                ),
                AppSpacerH(10),
                AppTextField(
                  name: 'message',
                  placeholder: 'Message',
                  showTitle: false,
                  maxline: 8,
                  validator: FormBuilderValidators.required(),
                ),
                AppSpacerH(20),
                Button(
                  title: 'Send Message',
                  isLoading: controller.isBusy.value,
                  onPressed: controller.contacUS,
                  height: 55,
                  width: Get.width * 0.9,
                  backgroundColor: COLOR_PRIMARY,
                ),
                AppSpacerH(20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 1,
                      width: getScreenWidth(context) / 3,
                      color: Colors.grey,
                    ),
                    Text(
                      'Support',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                    ),
                    Container(
                      height: 1,
                      width: getScreenWidth(context) / 3,
                      color: Colors.grey,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  Widget _buildTroubleshooting() {
    final List listtrouble = [
      {
        "id": 1,
        "title": "Follow troubleshooting steps to resolve common issues.",
      },
      {
        "id": 2,
        "title": "Follow troubleshooting steps to resolve common issues.",
      }
    ];
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: listtrouble.length,
                itemBuilder: (context, index) {
                  var item = listtrouble[index];
                  return MyFadeAnimation(
                    duration: 500 + index * 500,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      color: COLOR_PRIMARY,
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          height: 50, // Set a fixed height for the card
                          alignment: Alignment.center,
                          child: Text(
                            item["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // FAQ Tile Widget
  Widget _buildFAQTile(String title, String content) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      // color: Colors.white24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(content),
          ),
        ],
      ),
    );
  }
}
