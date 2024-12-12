import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';

class PharmacyContainer extends StatefulWidget {
  @override
  State<PharmacyContainer> createState() => _PharmacyContainerState();
}

class _PharmacyContainerState extends State<PharmacyContainer> {
  List pharmacylist = [
    {
      "title": "CVS Pharmacy",
      "btntext": "Set as preffered",
      "subtitle": "12740 W Eldorado Pkwy",
      "address": "Frisco, TX 75035",
      "phoneno": "USA (469) 362-5206",
      "email": "eldorado@cvspharmacy.com"
    },
    {
      "title": "Walgreens",
      "btntext": "Set as preffered",
      "subtitle": "6301 W Park Blvd",
      "address": "Plano, TX 75093",
      "phoneno": "USA (972) 781-1795",
      "email": "eldorado@cvspharmacy.com"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
        children: pharmacylist
            .map((item) => Card(
                  surfaceTintColor: Colors.white,
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              item["title"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  fontFamily: 'Poppins',
                                  color: Colors.black45),
                            ),
                            Container(
                              height: getScreenHeight(context) * 0.04,
                              width: getScreenWidth(context) * 0.32,
                              decoration: BoxDecoration(
                                  color: COLOR_ACCENT,
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  item["btntext"],
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                        const Divider(
                          thickness: 5,
                          endIndent: 300,
                          color: COLOR_ACCENT,
                        ),
                        Text(
                          item["subtitle"],
                          style: TextStyle(
                            color: Colors.black45,
                            fontFamily: 'Poppins',
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              item["address"],
                              style: TextStyle(
                                color: Colors.black45,
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
                              color: Colors.amber,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              item["phoneno"],
                              style: TextStyle(
                                color: Colors.black45,
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
                          item["email"],
                          style: TextStyle(
                            color: COLOR_PRIMARY,
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        )
                      ],
                    ),
                  ),
                ))
            .toList() as List<Widget>);
  }
}
