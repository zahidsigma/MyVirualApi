import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/resusable_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

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
      'image1': 'assets/icons/one.svg'
    },
    {
      'title': '3.9 Billion',
      'subtitle': 'Historical\nRecords',
      'image': 'assets/icons/his.svg',
      'image1': 'assets/icons/two.svg'
    },
    {
      'title': '89 Billion',
      'subtitle': 'Business\nRecords',
      'image': 'assets/icons/sear.svg',
      'image1': 'assets/icons/three.svg'
    },
    {
      'title': '6 Billion',
      'subtitle': 'Consumer\nRecords',
      'image': 'assets/icons/consumer.svg',
      'image1': 'assets/icons/four.svg'
    },
    {
      'title': '600 Million',
      'subtitle': 'Court\nRecords',
      'image': 'assets/icons/coort.svg',
      'image1': 'assets/icons/five.svg'
    },
    {
      'title': '120 + Social',
      'subtitle': 'Networks',
      'image': 'assets/icons/socialrecord.svg',
      'image1': 'assets/icons/six.svg'
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10), // Safe area padding

            // Header Section
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 16.0),
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       SizedBox(height: 16),

            //       // Search Bar

            //     ],
            //   ),
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 20),
            //   decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //       border: Border.all(color: Colors.black12)),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: TextFormField(
            //           decoration: InputDecoration(
            //             hintText: 'Search your data',
            //             border: InputBorder.none,
            //             contentPadding: EdgeInsets.only(left: 16),
            //           ),
            //         ),
            //       ),
            //       Container(
            //         padding: EdgeInsets.all(12.5),
            //         decoration: BoxDecoration(
            //           color: Colors.black,
            //           borderRadius: BorderRadius.only(
            //               topRight: Radius.circular(10),
            //               bottomRight: Radius.circular(10)),
            //         ),
            //         child: Icon(Icons.mic, color: Colors.white),
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(height: 24),

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
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(text: 'Leading Reports'),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 12,
                    mainAxisSpacing: 12,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    children: [
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/contact.svg",
                            height: 25),
                        title: 'Contact',
                        subtitle: 'Information',
                      ),
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/location.svg",
                            height: 25),
                        title: 'Location',
                        subtitle: 'History',
                      ),
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/family.svg",
                            height: 25),
                        title: 'Family And',
                        subtitle: 'Associates',
                      ),
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/socialmedia.svg",
                            height: 25),
                        title: 'Social Media',
                        subtitle: 'Accounts',
                      ),
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/persondeails.svg",
                            height: 25),
                        title: 'Personal',
                        subtitle: 'Details',
                      ),
                      ReportCard(
                        imageWidget: ReusableWidget.loadSvg(
                            "assets/icons/criminal.svg",
                            height: 25),
                        title: 'Criminal',
                        subtitle: 'Records',
                      )
                    ],
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Records Section
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
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
                            text: 'of Records', style: TextStyle(fontSize: 28)),
                      ],
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
                            right: index == Record.length - 1
                                ? 0
                                : 8, // spacing between cards
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

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// Report Card Widget
// class ReportCard extends StatelessWidget {
//   final Image image;
//   final String title;
//   final String subtitle;

//   const ReportCard({
//     required this.image,
//     required this.title,
//     required this.subtitle,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Color(0xffEBEFEF),
//         borderRadius: BorderRadius.circular(8),
//         boxShadow: [
//           // BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
//         ],
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Image.asset(image as String),
//           SizedBox(height: 8),
//           Text(
//             title,
//             style: TextStyle(
//                 fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
//           ),
//           Text(
//             subtitle,
//             style: TextStyle(fontSize: 12, color: Colors.grey[600]),
//           ),
//         ],
//       ),
//     );
//   }
// }

class ReportCard extends StatelessWidget {
  final Widget imageWidget; // Change from Image/String to Widget
  final String title;
  final String subtitle;

  const ReportCard({
    required this.imageWidget,
    required this.title,
    required this.subtitle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: Color(0xffEBEFEF),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageWidget, // Directly use the widget
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
    );
  }
}

// Record Card Widget
// class RecordCard extends StatelessWidget {
//   final String title;
//   final String subtitle;
//   final String? image; // Icon/image displayed at the top
//   final String? image1; // Background image

//   const RecordCard({
//     required this.title,
//     required this.subtitle,
//     required this.image,
//     required this.image1,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 140,
//       height: 100,
//       padding: EdgeInsets.all(12),
//       margin: EdgeInsets.symmetric(horizontal: 6), // spacing between cards
//       decoration: BoxDecoration(
//         color: Colors.black87,
//         borderRadius: BorderRadius.circular(8),
//       ),
//       child: Stack(
//         // crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Image.asset(
//             ReusableWidget.loadSvg(image1!, height: 25),
//           ),
//           if (image != null) ReusableWidget.loadSvg(image!, height: 25),
//           // Image.asset(
//           //   image!,
//           //   width: 32,
//           //   height: 32,
//           //   fit: BoxFit.contain,
//           // ),
//           SizedBox(height: 12),
//           Text(
//             title,
//             style: TextStyle(
//               fontSize: 15,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             subtitle,
//             style: TextStyle(
//               fontSize: 13,
//               color: Colors.white,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
