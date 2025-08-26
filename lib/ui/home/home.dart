import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class Home extends StatefulWidget {
  final VoidCallback? onShowModal;
  const Home({super.key, this.onShowModal});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    print('Home called');
  }

  List<Map<String, dynamic>> Record = [
    {
      'title': '130 Million',
      'subtitle': 'Property\nRecords',
      'image': 'assets/icons/build.svg',
      'image1': 'assets/icons/GroupHome1.svg'
    },
    {
      'title': '3.9 Billion',
      'subtitle': 'Historical\nRecords',
      'image': 'assets/icons/his.svg',
      'image1': 'assets/icons/GroupHome2.svg'
    },
    {
      'title': '89 Billion',
      'subtitle': 'Business\nRecords',
      'image': 'assets/icons/sear.svg',
      'image1': 'assets/icons/GroupHome3.svg'
    },
    {
      'title': '6 Billion',
      'subtitle': 'Consumer\nRecords',
      'image': 'assets/icons/consumer.svg',
      'image1': 'assets/icons/GroupHome4.svg'
    },
    {
      'title': '600 Million',
      'subtitle': 'Court\nRecords',
      'image': 'assets/icons/coort.svg',
      'image1': 'assets/icons/GroupHome5.svg'
    },
    {
      'title': '120 + Social',
      'subtitle': 'Networks',
      'image': 'assets/icons/socialrecord.svg',
      'image1': 'assets/icons/GroupHome6.svg'
    },
  ];

  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: ' Investigate',
      middletext: ' with',
      subtitle: ' Confidence',
      istitle: true,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20), // Safe area padding

            // Grid Section: Leading Reports
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        left: 0), // 👈 set your desired left padding
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 28,
                          color: Colors.black,
                          fontWeight: FontWeight.w300,
                          height: 1.2,
                        ),
                        children: [
                          TextSpan(text: 'Get '),
                          TextSpan(
                            text: 'Industry\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: COLOR_PRIMARY),
                          ),
                          TextSpan(text: 'Leading Reports'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  MediaQuery.removePadding(
                    context: context,
                    removeBottom: true,
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 12,
                      mainAxisSpacing: 12,
                      shrinkWrap: true,
                      physics:
                          const NeverScrollableScrollPhysics(), // ✅ disable inner scroll
                      padding: EdgeInsets.zero,

                      children: [
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact1.svg",
                                height: 40),
                            title: 'Contact',
                            subtitle: 'Information',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact6.svg",
                                height: 40),
                            title: 'Location',
                            subtitle: 'History',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact5.svg",
                                height: 40),
                            title: 'Family And',
                            subtitle: 'Associates',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact2.svg",
                                height: 40),
                            title: 'Social Media',
                            subtitle: 'Accounts',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact3.svg",
                                height: 40),
                            title: 'Personal',
                            subtitle: 'Details',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact4.svg",
                                height: 40),
                            title: 'Criminal',
                            subtitle: 'Records',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact7.svg",
                                height: 40),
                            title: 'Property',
                            subtitle: 'Records',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact9.svg",
                                height: 40),
                            title: 'Business',
                            subtitle: 'Records',
                            onTap: widget.onShowModal),
                        ReportCard(
                            imageWidget: ReusableWidget.loadSvg(
                                "assets/icons/contact8.svg",
                                height: 40),
                            title: 'Comprehensive',
                            subtitle: 'Reports',
                            onTap: widget.onShowModal)
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Records Section
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w300),
                        children: [
                          TextSpan(
                              text: 'Billions ',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 28)),
                          TextSpan(
                              text: 'of Records',
                              style: TextStyle(fontSize: 28)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  SizedBox(
                    height: 140,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: Record.length,
                      itemBuilder: (context, index) {
                        var item = Record[index];

                        return Padding(
                          padding: EdgeInsets.only(
                            right: index == Record.length - 1 ? 0 : 8,
                          ),
                          child: RecordCard(
                            title: item['title'],
                            subtitle: item['subtitle'],
                            image1: item['image1'],
                            image: item['image'],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final Widget imageWidget;
  final String title;
  final String subtitle;
  final VoidCallback? onTap; // 👈 Add this

  const ReportCard({
    required this.imageWidget,
    required this.title,
    required this.subtitle,
    this.onTap, // 👈 Accept from constructor
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // 👈 Tap callback here
      child: Container(
        padding: EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Color(0xffEBEFEF),
          // color: COLOR_PRIMARY,
          // gradient: LinearGradient(
          //   colors: [COLOR_PRIMARY, DARK_BG_COLOR],
          //   begin: Alignment.topLeft,
          //   end: Alignment.bottomRight,
          // ),

          // border: Border.all(width: 1, color: COLOR_PRIMARY),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget,
            SizedBox(height: 8),
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(fontSize: 11.5, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class RecordCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? image; // Icon at the top
  final String? image1; // Background SVG

  const RecordCard({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.image,
    required this.image1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140,
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 6),
      child: Stack(
        children: [
          // Background SVG
          Container(
            child: ReusableWidget.loadSvg(
              image1!,
              height: double.infinity,
            ),
          ),

          // Foreground content
          Positioned(
            top: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (image != null)
                  ReusableWidget.loadSvg(
                    image!,
                    height: 25,
                  ),
                const SizedBox(height: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    fontSize: 13,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
