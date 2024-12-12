import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:virualapi/ui/childrens/children_controller.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/circular_loader.dart';
import 'package:virualapi/widgets/date_picker.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:virualapi/widgets/radio_group.dart';
import 'package:virualapi/widgets/text_field.dart';

import '../../widgets/button.dart';

class AddChildren extends GetView<ChildrenController> {
  const AddChildren({super.key});

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      body: Obx(() => controller.isBusy.isTrue
          ? CircluarLoader()
          : FormBuilder(
              key: controller.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 50.0, left: 20, right: 20, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppTextField(
                        placeholder: "Full Name",
                        name: "name",
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                      Text("You will NOT be able to change name later"),
                      AppSpacerH(20),
                      RadioGroup(
                          name: 'gender',
                          placeholder: "Gender",
                          showTitle: true,
                          title: "Gender",
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
                      DateTimePicker(
                        name: 'dob',
                        showTitle: true,
                        title: "Dob",
                        placeholder: "Select Date Of Birth",
                        minDate: DateTime(1900, 1, 1),
                        maxDate: DateTime.now(),
                        validator: FormBuilderValidators.compose(
                          [
                            FormBuilderValidators.required(),
                          ],
                        ),
                      ),
                      AppSpacerH(20),
                      Button(
                        isLoading: false, //controller.isBusy.value,
                        height: 55,
                        title: "Save Member",
                        onPressed: controller.handleSubmit,
                        backgroundColor: Color(0xFFEB8F07),
                      ),
                    ],
                  ),
                ),
              ))),
    );
  }
}
