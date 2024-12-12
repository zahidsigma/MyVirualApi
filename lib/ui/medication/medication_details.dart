import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class MedicationDetails extends StatelessWidget {
  final Map<String, dynamic> item;
  const MedicationDetails({super.key, required this.item});

  // EmptyList(
  //           title: "N0 Medication Yet",
  //           subtitle: "Mainne Abhi Koi bh Dawai nh Kharedi",
  //           imagePath: 'medtab')

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(children: [
            Container(
              height: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/pills_1.png")),
                  color: Color(0xffEBFECD),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45))),
              width: MediaQuery.of(context).size.width,
              // Stack(children: [
              //   Padding(
              //     padding: const EdgeInsets.all(8.0),
              //     child: IconButton(
              //         onPressed: () {},
              //         icon: Icon(
              //           Icons.arrow_back_ios,
              //           color: Colors.black,
              //         )),
              //   )
              // ]),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 50),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(item["name"],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: GREY_TEXT_COLOR,
                        )),
                    Row(
                      children: [
                        Text("Tablels. ",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: GREY_TEXT_COLOR,
                            )),
                        Text(item["strength"],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: GREY_TEXT_COLOR,
                            )),
                      ],
                    ),
                    AppSpacerH(20),
                    Row(
                      children: [
                        Text("\$4.69",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: COLOR_PRIMARY)),
                        AppSpacerW(10),
                        Text("10 in stock",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: COLOR_ACCENT,
                            )),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidget("Pills", "Dosageform"),
                          CustomWidget("iburofen", "Active subastances")
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30, top: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomWidget("0.2g", "Dosage"),
                          CustomWidget("Biosyb,Russian", "Manufacturer")
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            AppSpacerH(20),
          ]),
        ),
        Button(
          title: "ADD To CART",
          height: 60,
          backgroundColor: COLOR_ACCENT,
          onPressed: () {},
        )
      ],
    ));
  }
}

Widget CustomWidget(title, subtitle) {
  return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
    Text(
      title,
      style: TextStyle(
          fontSize: 15, fontWeight: FontWeight.bold, color: GREY_TEXT_COLOR),
    ),
    Text(
      subtitle,
      style: TextStyle(
          fontSize: 12, fontWeight: FontWeight.bold, color: Colors.black45),
    ),
  ]);
}
