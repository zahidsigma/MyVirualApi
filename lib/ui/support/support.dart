import 'package:flutter/material.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:virualapi/Animation/my_slide_transition.dart';
import 'package:virualapi/constants/constant.dart';
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

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: 'Help & ',
      subtitle: 'Support',
      body: Column(
        children: [
          // Custom Tab Buttons
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
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
        foregroundColor: isSelected ? Colors.white : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(label),
    );
  }

  Widget _buildScreenContent() {
    switch (selectedTabIndex) {
      case 0:
        return _buildFAQs();
      case 1:
        return _buildContactUs();
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

  Widget _buildContactUs() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              // Icon(Icons.contact_mail, size: 100, color: Colors.blue),
              // SizedBox(height: 16),
              // Text('For support, email us at: support@example.com'),
              AppTextField(
                name: 'name',
                showTitle: false,
                title: "Username",
                rectangleborder: true,
                placeholder: "Name",
                validator: FormBuilderValidators.compose(([
                  FormBuilderValidators.required(),
                ])),
              ),
              AppSpacerH(10),
              AppTextField(
                name: 'email',
                showTitle: false,
                title: "Username",
                rectangleborder: true,
                placeholder: "Email",
                validator: FormBuilderValidators.compose(([
                  FormBuilderValidators.required(),
                ])),
              ),
              AppSpacerH(10),
              AppTextField(
                name: 'phone',
                showTitle: false,
                title: "Username",
                rectangleborder: true,
                placeholder: "Phone",
                validator: FormBuilderValidators.compose(([
                  FormBuilderValidators.required(),
                ])),
              ),
              AppSpacerH(10),
              AppTextField(
                name: 'message',
                showTitle: false,
                maxline: 10,
                title: "Message",
                rectangleborder: true,
                placeholder: "Message",
                validator: FormBuilderValidators.compose(([
                  FormBuilderValidators.required(),
                ])),
              ),
              AppSpacerH(20),
              Button(
                // isLoading: controller.isBusy.value,
                height: 55,
                width: getScreenWidth(context) * 0.9,
                title: "Sent Message",
                onPressed: () {
                  // if (controller.formKey.currentState
                  //         ?.saveAndValidate() ??
                  //     false) {
                  //   final formValues =
                  //       controller.formKey.currentState!.value;
                  //   final username = formValues['username'];
                  //   final password = formValues['password'];

                  //   // Print username and password to the terminal
                  //   debugPrint("Username: $username");
                  //   debugPrint("Password: $password");

                  // Call the login method or perform your logic here
                  // controller.onLogin();
                  // } else {
                  //   debugPrint("Form validation failed");
                  // }
                },
                backgroundColor: COLOR_PRIMARY,
              ),
            ],
          ),
        ),
      ),
    );
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
                  return MySlideTransition(
                    duration: 800 + index * 500,
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
      color: Colors.white24,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ExpansionTile(
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
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
