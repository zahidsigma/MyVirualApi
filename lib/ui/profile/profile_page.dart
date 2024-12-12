import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/drop_down.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/text_field.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Obx(
          () => FormBuilder(
            key: controller.formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: getScreenHeight(context) * 0.1,
                  ),
                  Text("Update Profile",
                      style: Theme.of(context).textTheme.titleLarge),
                  Text("Please provide information to continue"),
                  SizedBox(
                    height: 80,
                  ),
                  Text(
                    "Body Measurement",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: 85,
                        child: AppTextField(
                          name: 'weight',
                          formatters: [FilteringTextInputFormatter.digitsOnly],
                          placeholder: 'Weight (lbs)',
                          inputType: TextInputType.number,
                          maxLength: 3,
                          showTitle: false,
                          fontSize: 12,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(2),
                          ]),
                        ),
                      ),
                      AppDropdown(
                        name: 'height_ft',
                        placeholder: "Height(ft)",
                        width: getScreenWidth(context) * 0.28,
                        placeholderStyle: TextStyle(fontSize: 12),
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        items: List.generate(
                            6,
                            (index) => DropdownMenuItem<String>(
                                  value: (index + 2).toString(),
                                  child: Text((index + 2).toString()),
                                )),
                      ),
                      AppDropdown(
                        name: 'height_in',
                        placeholder: "Height(in)",
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required(),
                        ]),
                        width: getScreenWidth(context) * 0.28,
                        placeholderStyle: TextStyle(fontSize: 12),
                        items: List.generate(
                            12,
                            (index) => DropdownMenuItem<String>(
                                  value: index.toString(),
                                  child: Text(index.toString()),
                                )),
                      ),

                      // Container(
                      //   width: 85,
                      //   child: AppTextField(
                      //     name: 'height_in',
                      //     inputType: TextInputType.number,
                      //     formatters: [FilteringTextInputFormatter.digitsOnly],
                      //     placeholder: 'Height(in)',
                      //     maxLength: 1,
                      //     showTitle: false,
                      //     fontSize: 12,
                      //     validator: FormBuilderValidators.compose([
                      //       FormBuilderValidators.required(),
                      //     ]),
                      //   ),
                      // ),
                    ],
                  ),
                  AppSpacerH(20),
                  Text(
                    "Upload Your Photo",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        color: Colors.black45),
                  ),
                  AppSpacerH(10),
                  GestureDetector(
                    onTap: controller.getImage,
                    child: DottedBorder(
                      child: Container(
                        height: getScreenHeight(context) * 0.15,
                        width: getScreenWidth(context) * 4.5,
                        child: controller.userImage.value == null
                            ? Image.asset("assets/images/image.png")
                            : Image.file(controller.userImage.value!),
                      ),
                    ),
                  ),
                  AppSpacerH(30),
                  Button(
                    isLoading: controller.isBusy.value,
                    height: 55,
                    title: "Save",
                    onPressed: controller.updateProfile,
                    backgroundColor: Color(0xFFEB8F07),
                  ),
                ],
              ),
            ),
          ),
        )),
      ),
    );
  }
}
