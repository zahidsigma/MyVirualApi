import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/widgets/body_with_header.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isMenuVisible: true,
      isBackVisible: true,
      //  title: "Your Subscription",
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10, bottom: 5),
              child: Text(
                "Your Subscription",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 280,
              width: 400,
              margin: EdgeInsets.symmetric(horizontal: 15),
              padding: EdgeInsets.symmetric(horizontal: 10),
              // padding: const Edge
              // Insets.all(16),
              // margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Color(0xffEBEFEF),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  // Left Section
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 24,
                              backgroundImage:
                                  AssetImage("assets/images/profile.png"),
                            ),
                            const SizedBox(width: 10),
                            Flexible(
                              // Allows text to take space only as needed
                              child: Text(
                                "Harris Siderakisffsfsfssffsfsfsfsffsfsfsfsfsfsffsfsfsfsfsfffsfsfsfsfs",
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                                softWrap: false, // Ensures truncation
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey[600],
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          "Current Plan",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "(Basic)",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Searches",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "100 Searches allowed\nper month.",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 10),
                        const Text(
                          "Your Plan Price",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "\$99.99",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          "Per month",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),

                  // Right Section
                  Container(
                    width: 150,
                    padding: const EdgeInsets.all(10),
                    margin: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      children: [
                        // Circular Progress
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            SizedBox(
                              height: 80,
                              width: 80,
                              child: CircularProgressIndicator(
                                value: 0.5, // 50% progress
                                strokeWidth: 6,
                                backgroundColor: Colors.grey[800],
                                valueColor: const AlwaysStoppedAnimation<Color>(
                                    Colors.green),
                              ),
                            ),
                            const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "50",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Text(
                                  "Checks",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        // Last Update
                        Text(
                          "Last Update",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const Text(
                          "12/31/2024",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        Text(
                          "Ex. 01/31/2025",
                          style: TextStyle(color: Colors.grey[500]),
                        ),
                        const SizedBox(height: 16),
                        // Payment Info
                        Row(
                          children: [
                            SvgPicture.asset(
                              "assets/images/visa.svg", // Make sure to have the Visa SVG
                              height: 15,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              "BCA ***239",
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        // Update Button
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: COLOR_PRIMARY,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: const EdgeInsets.symmetric(vertical: 12),
                            ),
                            child: const Text(
                              "Update Your Plan",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 5),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Upgrade Your ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 25),
                    ),
                    TextSpan(
                      text: "Plan",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 200, // Set a fixed height for PricingScrollWidget
              child: PricingScrollWidget(),
            ),
          ],
        ),
      ),
    );
  }
}

class PricingScrollWidget extends StatefulWidget {
  @override
  _PricingScrollWidgetState createState() => _PricingScrollWidgetState();
}

class _PricingScrollWidgetState extends State<PricingScrollWidget> {
  final List<Map<String, dynamic>> _plans = [
    {
      'name': 'Basic',
      'subtitle': '(Per month)',
      'price': 100,
      'features': ['100 searches/ Month', 'Email support']
    },
    {
      'name': 'Premium',
      'subtitle': '(3 months)',
      'price': 260,
      'features': ['300 searches', 'Priority email support', 'Advanced filters']
    },
    {
      'name': 'EnterPrize',
      'subtitle': '(Yearly)',
      'price': 500,
      'features': ['Unlimited searches', '24/7 support', 'Custom integrations']
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ListView.builder(
            physics: AlwaysScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: _plans.length,
            itemBuilder: (context, index) {
              var item = _plans[index];
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: 200,
                  width: MediaQuery.of(context).size.width / 1.1,
                  decoration: BoxDecoration(
                    gradient:
                        LinearGradient(colors: [Colors.black, COLOR_PRIMARY]),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  padding: EdgeInsets.all(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                item['name'],
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 2),
                                child: Text(
                                  item['subtitle'].toString(),
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 12, // Smaller font for subtitle
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '\$${item['price']}',
                            style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: item['features'].map<Widget>((feature) {
                          return Row(
                            children: [
                              Icon(
                                Icons.check_circle,
                                color: Colors.green,
                                size: 15,
                              ),
                              SizedBox(width: 8),
                              Text(feature,
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
