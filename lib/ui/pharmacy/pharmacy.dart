import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/home/widgets/home_categories.dart';
import 'package:virualapi/ui/home/widgets/home_header.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import 'package:virualapi/ui/home/widgets/drawer.dart';
import 'package:virualapi/ui/pharmacy/widgets/phr_container.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/bottom_nav_bar.dart';

class PharmacyScreen extends StatefulWidget {
  const PharmacyScreen({super.key});

  @override
  State<PharmacyScreen> createState() => _PharmacyScreenState();
}

class _PharmacyScreenState extends State<PharmacyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // bottomNavigationBar: BottomNavBar(),
      backgroundColor: COLOR_PRIMARY,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                HomeHeader(
                  hintText: 'Serach Pharmacy city or zip code',
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xffF7F8F9),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50),
                              topRight: Radius.circular(60))),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 20),
                        child: Column(
                          children: [
                            Column(
                              children: [
                                HomeTitle(
                                  title: "Preffered Pharmacy",
                                ),
                                Container(
                                    margin:
                                        EdgeInsets.only(top: 20, bottom: 10),
                                    padding: EdgeInsets.only(
                                      left: 20,
                                      top: 20,
                                      right: 20,
                                    ),
                                    height: getScreenHeight(context) * 0.2,
                                    width: getScreenWidth(context),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff1B95AF),
                                    ),

                                    // color: Color(0xff1B95AF)),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "CVS Pharmacy",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                        const Divider(
                                          thickness: 0.5,
                                          color: Colors.white,
                                        ),
                                        Text(
                                          "270 Stonebrook Pkwy",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Poppins',
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "Frisco, TX 75035",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Container(
                                              height: 15,
                                              width: 1,
                                              color: Colors.white,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              "USA (469) 362-5206",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: 'Poppins',
                                                fontSize: 15,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          "",
                                          style: TextStyle(
                                            color: COLOR_PRIMARY,
                                            fontFamily: 'Poppins',
                                            fontSize: 15,
                                          ),
                                        )
                                      ],
                                    )),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    HomeTitle(
                                      title: "Select a New Pharmacy",
                                    ),
                                    PharmacyContainer()
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                bottom: 0,
                child: Container(
                    height: getScreenHeight(context) * 0.05,
                    width: getScreenWidth(context),
                    color: Color(0xffFEE9CB),
                    child: InkWell(
                      onTap: () {
                        print("hi");
                      },
                      child: Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset("assets/images/upload.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Upload Prescription",
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: COLOR_ACCENT),
                            ),
                          ],
                        ),
                      ),
                    )))
          ],
        ),
      ),
    );
  }
}

_showSimpleModalDialog(context) {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
          child: Container(
            constraints: BoxConstraints(maxHeight: 350),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    textAlign: TextAlign.justify,
                    text: TextSpan(
                        text: "Text",
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black,
                            wordSpacing: 1)),
                  ),
                ],
              ),
            ),
          ),
        );
      });
}
