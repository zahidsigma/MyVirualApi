// import 'package:flutter/material.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

import 'package:flutter/material.dart';
import 'package:virualapi/utils/metrics.dart';
import 'package:virualapi/widgets/body_with_header.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
      // backgroundColor: Colors.grey[100],
      isBackVisible: false,
      isMenuVisible: true,
      isrofile: true,
      title: 'My Profile',

      body: Column(
        children: [
          // Profile Image with Edit Icon

          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.green,
          //     shape: BoxShape.circle,
          //     border: Border.all(width: 2, color: Colors.white),
          //   ),
          //   child: const Icon(
          //     Icons.edit,
          //     color: Colors.white,
          //     size: 20,
          //   ),
          // ),
          // const SizedBox(height: 16),
          // Name and Email
          SizedBox(
            height: getScreenHeight(context) * 0.1,
          ),
          const Text(
            "Harris Siderakis",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          const Text(
            "Harris_siderakis@icloud.com",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 16),
          // Edit Profile Button
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.black,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            onPressed: () {},
            child: const Text("Edit Profile"),
          ),
          const SizedBox(height: 32),
          // Options List
          const Divider(height: 1),
          OptionTile(
            icon: Icons.subscriptions,
            text: "Subscription Details",
            onTap: () {},
          ),
          OptionTile(
            icon: Icons.access_time,
            text: "Recent Activity",
            onTap: () {},
          ),
          OptionTile(
            icon: Icons.logout,
            text: "Logout",
            onTap: () {},
            textColor: Colors.red,
            iconColor: Colors.black,
          ),
        ],
      ),
    );
  }
}

class OptionTile extends StatelessWidget {
  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color textColor;
  final Color iconColor;
  const OptionTile({
    Key? key,
    required this.icon,
    required this.text,
    required this.onTap,
    this.textColor = Colors.black,
    this.iconColor = Colors.grey,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
      leading: Icon(icon, color: iconColor),
      title: Text(
        text,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: textColor,
        ),
      ),
      trailing:
          const Icon(Icons.arrow_forward_ios, size: 18, color: Colors.grey),
      tileColor: Colors.grey[200],
    );
  }
}
