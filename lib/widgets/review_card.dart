import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/metrics.dart';

class ReviewCard extends StatelessWidget {
  final String name;
  final String review;
  final String location;
  // final String profileImageUrl;
  final double rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.review,
    required this.location,
    // required this.profileImageUrl,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          decoration: BoxDecoration(
              // color: const Color(0xFF1C1C1C),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                width: 0.7,
                color: COLOR_PRIMARY,
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // const SizedBox(height: 40),
              const SizedBox(height: 10),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                review,
                style: const TextStyle(
                  color: COLOR_PRIMARY,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                location,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RatingBarIndicator(
                    rating: rating,
                    itemBuilder: (context, _) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 24,
                    direction: Axis.horizontal,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    rating.toStringAsFixed(1),
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: COLOR_PRIMARY,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        // Positioned(
        //   top: 0,
        //   left: getScreenWidth(context) / 2 - 50, // Center avatar
        //   child: CircleAvatar(
        //     radius: 40,
        //     backgroundColor: Colors.white,
        //     child: CircleAvatar(
        //       radius: 36,
        //       backgroundImage: NetworkImage(profileImageUrl),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
