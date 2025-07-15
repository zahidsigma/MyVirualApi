import 'package:flutter/material.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  final void Function() onBack; // Back callback

  ReviewScreen({
    super.key,
    required this.onBack,
  });

  final List<Map<String, dynamic>> reviews = [
    {
      "name": "Harris Siderakis",
      "profileImage": "https://randomuser.me/api/portraits/men/32.jpg",
      "review":
          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry’s standard dummy text ever since the 1500s.",
      "rating": 4.7
    },
    {
      "name": "Jane Doe",
      "profileImage": "https://randomuser.me/api/portraits/women/45.jpg",
      "review": "Absolutely loved the experience. Great service and support!",
      "rating": 5.0
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: true, // show back button
      istitle: true,
      onBackPressed: onBack, // pass the back callback here
      isMenuVisible: false,
      title: 'Happy',
      middletext: ' Client',
      subtitle: 'Reviews',
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: reviews.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final review = reviews[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 32),
                  child: ReviewCard(
                    name: review['name'],
                    review: review['review'],
                    profileImageUrl: review['profileImage'],
                    rating: review['rating'],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
