import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:virualapi/ui/profile/profile_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/date_picker.dart';
import 'package:virualapi/widgets/drop_down.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/radio_group.dart';
import 'package:virualapi/widgets/text_field.dart';

class UpdateProfile extends GetView<ProfileController> {
  const UpdateProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SafeArea(
            child: Obx(
          () => FormBuilder(
            key: controller.formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Update Profile",
                            style: Theme.of(context).textTheme.titleLarge),
                        Text("Please provide information to continue"),
                        AppSpacerH(50),
                        AppTextField(
                          name: 'name',
                          title: "Full Name",
                          placeholder: "Enter Name",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(3),
                          ]),
                        ),
                        AppSpacerH(20),
                        DateTimePicker(
                          name: 'dob',
                          title: "Date of Birth",
                          placeholder: "Select Date of Birth",
                          minDate: DateTime(1900, 1, 1),
                          maxDate: DateTime.now(),
                          validator: FormBuilderValidators.compose(
                            [
                              FormBuilderValidators.required(),
                            ],
                          ),
                        ),
                        AppSpacerH(20),
                        AppTextField(
                          name: 'address',
                          title: "Address",
                          placeholder: "Enter complete address",
                        ),
                        AppSpacerH(10),
                        AppTextField(
                          name: 'country',
                          showTitle: false,
                          placeholder: "Enter country",
                        ),
                        AppSpacerH(10),
                        AppTextField(
                          name: 'city',
                          showTitle: false,
                          placeholder: "Enter city",
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                          ]),
                        ),
                        AppSpacerH(20),
                        InternationalPhoneNumberInput(
                          onInputChanged: (PhoneNumber number) {
                            var phoneNum =
                                number.phoneNumber?.split(number.dialCode!)[1];
                            var finalNum =
                                "${number.dialCode?.substring(1)} ${phoneNum}";
                            controller.phoneNumberVal = finalNum;
                            print("patched $finalNum");
                          },
                          onInputValidated: (bool value) {
                            controller.isPhoneNumberValid = value;
                            print("onInputValidated $value");
                          },
                          inputDecoration: InputDecoration(),
                          selectorConfig: SelectorConfig(
                            selectorType: PhoneInputSelectorType.DIALOG,
                          ),
                          initialValue: controller.phoneNumber.value,
                          ignoreBlank: false,
                          textFieldController:
                              controller.phoneTextFieldController,
                          autoValidateMode: AutovalidateMode.onUserInteraction,
                          selectorTextStyle: TextStyle(color: Colors.black),
                          formatInput: true,
                          keyboardType: TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                          inputBorder: OutlineInputBorder(),
                          onSaved: (PhoneNumber number) {
                            print('On Saved: $number');
                          },
                        ),
                        AppSpacerH(20),
                        AppTextField(
                          name: 'email',
                          title: "Email",
                          placeholder: "Enter email address",
                        ),
                        AppSpacerH(20),
                        RadioGroup(
                            name: 'gender',
                            placeholder: "Gender",
                            showTitle: true,
                            title: "Gender",
                            initialValue: "Male",
                            validator: FormBuilderValidators.compose(
                              [
                                FormBuilderValidators.required(),
                              ],
                            ),
                            options: [
                              FormBuilderFieldOption(value: "Male"),
                              FormBuilderFieldOption(value: "Female"),
                            ]),
                        AppSpacerH(20),
                        Text(
                          "Body Measurement",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                        AppTextField(
                          name: 'weight',
                          formatters: [FilteringTextInputFormatter.digitsOnly],
                          placeholder: 'Weight (lbs)',
                          inputType: TextInputType.number,
                          maxLength: 3,
                          showTitle: false,
                          fontSize: 14,
                          validator: FormBuilderValidators.compose([
                            FormBuilderValidators.required(),
                            FormBuilderValidators.minLength(2),
                          ]),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppDropdown(
                              name: 'height_ft',
                              placeholder: "Height(ft)",
                              width: getScreenWidth(context) * 0.4,
                              placeholderStyle: TextStyle(fontSize: 14),
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
                            AppSpacerW(getScreenWidth(context) * 0.04),
                            AppDropdown(
                              name: 'height_in',
                              placeholder: "Height(in)",
                              width: getScreenWidth(context) * 0.4,
                              placeholderStyle: TextStyle(fontSize: 14),
                              validator: FormBuilderValidators.compose([
                                FormBuilderValidators.required(),
                              ]),
                              items: List.generate(
                                  12,
                                  (index) => DropdownMenuItem<String>(
                                        value: index.toString(),
                                        child: Text(index.toString()),
                                      )),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                AppSpacerH(10),
                Button(
                  isLoading: controller.isBusy.value,
                  height: 50,
                  title: "Update",
                  onPressed: controller.updateMainProfile,
                  backgroundColor: Color(0xFFEB8F07),
                ),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
