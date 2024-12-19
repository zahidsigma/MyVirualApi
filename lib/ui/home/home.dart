import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';

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

  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: false,
      isMenuVisible: true,
      title: 'Investigation',
      subtitle: 'with Confidence',
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50), // Safe area padding

            // Header Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16),

                  // Search Bar
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.black12)),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Search your data',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.only(left: 16),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(12.5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10),
                                bottomRight: Radius.circular(10)),
                          ),
                          child: Icon(Icons.mic, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),

            SizedBox(height: 24),

            // Grid Section: Leading Reports
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Get Industry Leading Reports',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.black87),
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
                          icon: Icons.call,
                          title: 'Contact',
                          subtitle: 'Information'),
                      ReportCard(
                          icon: Icons.location_on,
                          title: 'Location',
                          subtitle: 'History'),
                      ReportCard(
                          icon: Icons.family_restroom,
                          title: 'Family',
                          subtitle: 'Associates'),
                      ReportCard(
                          icon: Icons.person,
                          title: 'Social Media',
                          subtitle: 'Accounts'),
                      ReportCard(
                          icon: Icons.lock,
                          title: 'Personal',
                          subtitle: 'Details'),
                      ReportCard(
                          icon: Icons.gavel,
                          title: 'Criminal',
                          subtitle: 'Records'),
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
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: 'of Records'),
                      ],
                    ),
                  ),
                  SizedBox(height: 16),

                  // Records Cards
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RecordCard(
                          title: '130\nMillion',
                          subtitle: 'Property\nRecords',
                          image: "assets/images/prop.png",
                        ),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: RecordCard(
                            title: '3.9\nBillion',
                            subtitle: 'Historical\nRecords',
                            image: "assets/images/history.png"),
                      ),
                      SizedBox(width: 5),
                      Expanded(
                        child: RecordCard(
                            title: '3.9\nBillion',
                            subtitle: 'Historical\nRecords',
                            image: "assets/images/magnify.png"),
                      ),
                    ],
                  ),
                  // ListView.builder(
                  //     scrollDirection: Axis.horizontal,
                  //     itemCount: 3,
                  //     itemBuilder: (context, index) {
                  //       return RecordCard(
                  //           title: '3.9\nBillion',
                  //           subtitle: 'Historical\nRecords',
                  //           image: "assets/images/history.png");
                  //     })
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
class ReportCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const ReportCard({
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 4, offset: Offset(0, 2)),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 32, color: Colors.black87),
          SizedBox(height: 8),
          Text(
            title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        ],
      ),
    );
  }
}

// Record Card Widget
class RecordCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? image;
  const RecordCard(
      {required this.title, required this.subtitle, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: Colors.black87,
          borderRadius: BorderRadius.circular(8),
          image: DecorationImage(
              image: AssetImage("assets/images/record.png"),
              fit: BoxFit.cover)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(image!),
          Text(
            title,
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}
