import 'package:flutter/material.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/review_card.dart';

class AboutScreen extends StatelessWidget {
  final void Function() onBack; // Back callback

  AboutScreen({
    super.key,
    required this.onBack,
  });

  // final List<Map<String, dynamic>> reviews = [
  //   {
  //     "name": "Harris Siderakis",
  //     "profileImage": "https://randomuser.me/api/portraits/men/32.jpg",
  //     "review":
  //         "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s.",
  //     "rating": 4.7
  //   },
  //   {
  //     "name": "Jane Doe",
  //     "profileImage": "https://randomuser.me/api/portraits/women/45.jpg",
  //     "review": "Absolutely loved the experience. Great service and support!",
  //     "rating": 5.0
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: true, // show back button
      istitle: true,
      onBackPressed: onBack, // pass the back callback here
      isMenuVisible: false,
      title: 'About',
      subtitle: 'Virtual Pi',
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Column(
          children: [
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: reviews.length,
            //     padding: const EdgeInsets.all(16),
            //     itemBuilder: (context, index) {
            //       final review = reviews[index];
            //       return Padding(
            //         padding: const EdgeInsets.only(bottom: 32),
            //         child: ReviewCard(
            //           name: review['name'],
            //           review: review['review'],
            //           profileImageUrl: review['profileImage'],
            //           rating: review['rating'],
            //         ),
            //       );
            //     },
            //   ),
            // )
            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),

            Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.")
          ],
        ),
      ),
    );
  }
}
