import 'package:flutter/material.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/review_card.dart';

class ReviewScreen extends StatelessWidget {
  final void Function() onBack; // Back callback

  ReviewScreen({
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

  final List<Map<String, dynamic>> reviews = [
    {
      "quote":
          "I needed to verify a new marketing consultant before giving them access to client data. The report confirmed their identity and helped me proceed with confidence. Really efficient process.",
      "name": "Karen K.",
      "location": "Boston, MA",
      "rating": 5.0
    },
    {
      "quote":
          "We use this to verify every freelance designer we bring on board. We got some amazing people on board and did get some negative reports. I’d say it's quick, reliable, and gives us exactly what we need to stay professional and protected.",
      "name": "Michael M.",
      "location": "Atlanta, GA",
      "rating": 4.7
    },
    {
      "quote":
          "Before submitting personal records to a legal advisor I met online, I checked their identity on the app. Thank God for this platform that I was saved from a scam. I felt way more secure moving forward with the advisor.",
      "name": "Daniel D.",
      "location": "Phoenix, AZ",
      "rating": 4.7
    },
    {
      "quote":
          "Verified my dog sitter before leaving town for two weeks. I got a clean report and felt more relaxed knowing I wasn’t handing my baby to a bad person.",
      "name": "Alisha A.",
      "location": "Seattle, WA",
      "rating": 4.6
    },
    {
      "quote":
          "This is part of our SOP now for onboarding new team members. We verify each new hire’s identity and it has helped us avoid careless security risks in the past.",
      "name": "Brian B.",
      "location": "Newark, NJ",
      "rating": 4.0
    },
    {
      "quote":
          "A number kept calling my teenage daughter’s phone. Reverse search showed it belonged to an old classmate who always kept bullying her in school. I am so glad we checked the number on My Virtual PI.",
      "name": "Angela A.",
      "location": "Cleveland, OH",
      "rating": 4.9
    },
    {
      "quote":
          "We used reverse search to confirm the identity of someone calling himself a delivery driver. Turned out to be a scam. This tool saved us from a dangerous situation.",
      "name": "Tony T.",
      "location": "Houston, TX",
      "rating": 4.8
    },
    {
      "quote":
          "Reconnected with my college roommate through reverse phone lookup. He had changed numbers and I couldn’t find him anywhere else. This service really surprised me in the best way.",
      "name": "Chloe C.",
      "location": "San Diego, CA",
      "rating": 4.0
    },
    {
      "quote":
          "My mom kept receiving calls from a strange number late at night. I used this tool to identify the caller and we were able to block them just in time.",
      "name": "Lamar L.",
      "location": "Detroit, MI",
      "rating": 4.7
    },
    {
      "quote":
          "When a guy from Facebook Marketplace gave me his number, I used My Virtual PI to check him out first. Found his real name and info instantly. Very useful.",
      "name": "Samantha S.",
      "location": "Denver, CO",
      "rating": 4.8
    },
    {
      "quote":
          "I have very bad tenant experience previously, my friend Lisa suggested this app for future and upon using it, I can vouch for it to be the safest option before getting a new person in your home.",
      "name": "Priya P.",
      "location": "Fremont, CA",
      "rating": 4.2
    },
    {
      "quote":
          "Ran a background check on a private tutor I was hiring for my son. The report was clean and detailed. It helped us trust her more from day one.",
      "name": "Charles C.",
      "location": "Memphis, TN",
      "rating": 4.1
    },
    {
      "quote":
          "We use this during volunteer intake for our youth sports program. It helps keep our kids safe and makes sure every adult is properly vetted.",
      "name": "Denise D.",
      "location": "Charlotte, NC",
      "rating": 4.6
    },
    {
      "quote":
          "Checked the criminal history of a rideshare driver I was using regularly for my elderly father. It gave me the peace of mind I didn’t know I needed.",
      "name": "Victor V.",
      "location": "Philadelphia, PA",
      "rating": 4.7
    },
    {
      "quote":
          "We reviewed the history of a new delivery driver before assigning company property. The results were clear and the report was incredibly easy to understand. It’s now a norm for us to run a criminal check on My Virtual PI before we move forward with any employee.",
      "name": "Renee R.",
      "location": "Austin, TX",
      "rating": 4.7
    },
    {
      "quote":
          "We screened a potential tenant for my duplex apartment and uncovered a prior eviction that didn’t show up on their application. This tool saved me a huge future headache.",
      "name": "Nathan N.",
      "location": "Minneapolis, MN",
      "rating": 5
    },
    {
      "quote":
          "I verified rental history for a college student looking to sublet. Found a previous eviction he didn’t disclose. I passed on the lease and found someone more reliable.",
      "name": "Yasmine Y.",
      "location": "Orlando, FL",
      "rating": 4.7
    },
    {
      "quote":
          "I run a small property business and use eviction checks regularly. They help me avoid unnecessary risk and make better decisions about who lives on my properties.",
      "name": "John J.",
      "location": "Tampa, FL",
      "rating": 4.7
    },
    {
      "quote":
          "We reviewed the history of a new delivery driver before assigning company property. The results were clear and the report was incredibly easy to understand. It’s now a norm for us to run a criminal check on My Virtual PI before we move forward with any employee.",
      "name": "Renee R.",
      "location": "Austin, TX",
      "rating": 4.8
    },
    {
      "quote":
          "We screened a potential tenant for my duplex apartment and uncovered a prior eviction that didn’t show up on their application. This tool saved me a huge future headache.",
      "name": "Nathan N.",
      "location": "Minneapolis, MN",
      "rating": 4.6
    },
    {
      "quote":
          "I verified rental history for a college student looking to sublet. Found a previous eviction he didn’t disclose. I passed on the lease and found someone more reliable.",
      "name": "Yasmine Y.",
      "location": "Orlando, FL",
      "rating": 4.5
    },
    {
      "quote":
          "I run a small property business and use eviction checks regularly. They help me avoid unnecessary risk and make better decisions about who lives on my properties.",
      "name": "John J.",
      "location": "Tampa, FL",
      "rating": 4.7
    },
    {
      "quote":
          "I used this before renting to a couple with no credit history. Found clean records and felt comfortable moving forward. It was a great way to verify their responsibility.",
      "name": "Nicole N.",
      "location": "Nashville, TN",
      "rating": 4.6
    },
    {
      "quote":
          "The tool flagged an eviction on a guy claiming to have a clean record. Thanks to My Virtual PI, I didn’t give my apartment to this offender.",
      "name": "Roger R.",
      "location": "Baltimore, MD",
      "rating": 4.9
    },
    {
      "quote":
          "I hired a virtual assistant and used the workplace search to confirm her past employment. Everything seemed good and oh man I got one of my best employees.",
      "name": "Elliot E.",
      "location": "San Jose, CA",
      "rating": 5.0
    },
    {
      "quote":
          "Checked out a freelancer’s background with this tool before hiring. Super helpful and gave me peace of mind. Definitely something I’ll use again before bringing anyone on board.",
      "name": "Sandra S.",
      "location": "Portland, OR",
      "rating": 4.7
    },
    {
      "quote":
          "We hired a remote copywriter and confirmed her past agency roles using this tool. It aligned with her resume and helped us fast-track her onboarding.",
      "name": "Tina T.",
      "location": "Salt Lake City, UT",
      "rating": 4.6
    },
    {
      "quote":
          "I always had a little difficulty trusting new employees, with this app, the problem is solved because all I have to do now is check the profile and I am good to go.",
      "name": "Bruce B.",
      "location": "Columbus, OH",
      "rating": 4.5
    },
    {
      "quote":
          "One of our applicants claimed to work for a tech company that didn’t exist. This tool confirmed our suspicions and helped us avoid a potential security issue.",
      "name": "Lily L.",
      "location": "Chicago, IL",
      "rating": 4.8
    },
    {
      "quote":
          "I checked out a wedding photographer’s business info before booking. The records were clean and good to go. Honestly, I felt a lot better confirming they were legitimate.",
      "name": "Zaid Z.",
      "location": "Raleigh, NC",
      "rating": 4.6
    },
    {
      "quote":
          "We were considering a new digital marketing agency. Business search revealed some critical legal filings. That helped us choose a different provider with a clean background.",
      "name": "Maggie M.",
      "location": "Buffalo, NY",
      "rating": 4.4
    },
    {
      "quote":
          "We used this to check out a printing vendor for our nonprofit. Everything looked legit, and the clean history gave us confidence to move forward with a long-term deal.",
      "name": "Reggie R.",
      "location": "St. Louis, MO",
      "rating": 4.7
    },
    {
      "quote":
          "Found out a vendor who pitched us wasn’t even legally registered. Saved our finance team from making a costly mistake. We now run every new lead through here.",
      "name": "Olivia O.",
      "location": "Sacramento, CA",
      "rating": 5.0
    },
    {
      "quote":
          "I looked for the construction manager who offered to work for half of the market prices. Goodness that I checked, this guy was a fraud. I backed off just in time.",
      "name": "Isaac I.",
      "location": "Boise, ID",
      "rating": 4.9
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      isBackVisible: true, // show back button
      istitle: true,
      onBackPressed: onBack, // pass the back callback here
      isMenuVisible: false,
      title: 'Happy Client',
      // middletext: ' Client',
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
                  padding: const EdgeInsets.only(bottom: 5),
                  child: ReviewCard(
                    name: review['quote'] ?? '',
                    review: review['name'] ?? '',
                    location: review['location'],
                    // profileImageUrl: review['profileImage'],
                    rating: (review['rating'] as num).toDouble(),
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
