import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/widgets/doctor_details.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/button.dart';

class PremiumMember extends StatefulWidget {
  const PremiumMember({super.key});

  @override
  State<PremiumMember> createState() => _PremiumMemberState();
}

class _PremiumMemberState extends State<PremiumMember> {
  @override
  Widget build(BuildContext context) {
    final double screen_width = getScreenWidth(context);
    return Scaffold(
      backgroundColor: COLOR_PRIMARY,
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.only(top: 10, left: 10),
              child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ))),
          Expanded(
            child: SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  Stack(children: [
                    Container(
                      margin: const EdgeInsets.only(top: 60),
                      padding: EdgeInsets.only(top: 50, bottom: 10),
                      height: getScreenHeight(context),
                      width: getScreenHeight(context),
                      decoration: const BoxDecoration(
                          color: Color(0xffF7F8F9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(50))),
                      child: Column(
                        children: [
                          Text(
                            "Hi.Anna Lisa",
                            style: TextStyle(
                                fontFamily: 'Gotham',
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "Premium Membership",
                            style: TextStyle(
                                color: Colors.black38,
                                fontSize: 20,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "Valid Upto 23 jan 2022",
                            style: TextStyle(
                              fontFamily: 'Gotham',
                              fontSize: 13,
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Container(
                            height: getScreenHeight(context) * 0.12,
                            width: getScreenWidth(context) * 0.9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                border:
                                    Border.all(width: 1, color: COLOR_ACCENT)),
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                        text: "\$54.00",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            fontFamily: 'Poppins',
                                            color: Colors.black45,
                                            wordSpacing: 1),
                                        children: [
                                          TextSpan(
                                            text:
                                                " / 6 Months (\$8.99 / Month)",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 18,
                                                fontFamily: 'Poppins',
                                                color: Colors.black38,
                                                wordSpacing: 1),
                                          )
                                        ]),
                                  ),
                                  RichText(
                                    textAlign: TextAlign.justify,
                                    text: TextSpan(
                                      text: "instead of \$100 / 6 month",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Colors.black45,
                                          wordSpacing: 1),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Choose Our Premium Subscription And\n",
                                style: TextStyle(
                                    fontSize: 19,
                                    fontFamily: 'Poppins',
                                    color: Colors.black45,
                                    wordSpacing: 1),
                                children: [
                                  TextSpan(
                                    text: "Pay Zero Consultation Fees",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                      color: COLOR_PRIMARY,
                                    ),
                                  )
                                ]),
                          ),
                          Divider(
                            color: COLOR_ACCENT,
                            thickness: 5,
                            indent: 180,
                            endIndent: 180,
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          RichText(
                            textAlign: TextAlign.center,
                            text: TextSpan(
                                text: "Talk to a doctor ",
                                style: TextStyle(
                                    fontSize: 15,
                                    fontFamily: 'Poppins',
                                    color: Colors.black45,
                                    wordSpacing: 1),
                                children: [
                                  TextSpan(
                                    text: " Free",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 17,
                                      fontFamily: 'Poppins',
                                      color: COLOR_ACCENT,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        " Every moonth to\nevaluate your health",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontFamily: 'Poppins',
                                      color: Colors.black45,
                                    ),
                                  )
                                ]),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Discount on prescription deliveries",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Priority doctor bookings",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            "Dedicated Care Team",
                            style: TextStyle(
                              fontSize: 15,
                              fontFamily: 'Poppins',
                              color: Colors.black45,
                            ),
                          ),
                          SizedBox(
                            height: 40,
                          ),
                          Button(
                            height: 60,
                            width: getScreenWidth(context) * 0.95,
                            title: "RENEW SUBSCRIPTION",
                            backgroundColor: COLOR_ACCENT,
                            onPressed: () {},
                          )
                        ],
                      ),
                    ),

                    Positioned(
                        left: screen_width * 0.36,
                        child: Image.asset("assets/images/profile.png")),

                    Positioned(
                        top: getScreenHeight(context) * 0.25,
                        left: getScreenWidth(context) * 0.35,
                        child: Image.asset("assets/images/prem.png")),
                    // Container(
                    //   width: screen_width * 0.9,
                    //   child: Row(
                    //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //     children: [
                    //       SizedBox(width: screen_width * 0.03),
                    //       Image.asset("assets/images/doc.png"),
                    //       Text(
                    //         "Male",
                    //         style: TextStyle(
                    //             fontWeight: FontWeight.bold,
                    //             fontFamily: 'Poppins',
                    //             color: COLOR_ACCENT),
                    //       )
                    //     ],
                    //   ),
                    // )
                  ])
                ],
              ),
            ),
          ),
        ],
      )),
    );
  }
}
