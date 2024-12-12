import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/ui/doctor/doctor_controller.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/utils/metrics.dart';
import '../../../models/specialties.dart';

class HomeCategories extends StatelessWidget {
  final bool isExpanded;
  final bool isBusy;
  final List<Specialties> categories;
  final ScrollController _controller = ScrollController();
  final controller = Get.find<HomeController>();
  HomeCategories(
      {super.key,
      required this.isExpanded,
      required this.categories,
      required this.isBusy}) {
    // if (isExpanded) {
    //   Future.delayed(Duration(milliseconds: 200)).then(
    //       (value) => _controller.jumpTo(_controller.position.maxScrollExtent));
    // }
  }

  // List<Map<String, dynamic>> categories = [
  //   {"image": "assets/images/heart.png", "title": "Cardiologist"},
  //   {"image": "assets/images/derm.png", "title": "Dermatlogist"},
  //   {"image": "assets/images/phy.png", "title": "Physician"},
  //   {"image": "assets/images/lungs.png", "title": "Pulmonologist"},
  //   {"image": "assets/images/gyne.png", "title": "Gynecologist"},
  //   {"image": "assets/images/mental.png", "title": "Mental Health"},
  //   {"image": "assets/images/pedi.png", "title": "Pediatrician"},
  //   {"image": "assets/images/uro.png", "title": "Urologist"},
  //   {"image": "assets/images/pedi.png", "title": "Pediatrician"},
  //   {"image": "assets/images/uro.png", "title": "Urologist"},
  // ];

  List<Specialties> _getCategories() {
    return isExpanded || categories.length < 8
        ? categories
        : categories.sublist(0, 8);
  }

  Color getColorBasedOnIndex(int index) {
    // Define the sequence order
    List<Color> colorSequence = [
      COLOR_PRIMARY,
      COLOR_ACCENT,
      const Color(0xffFF596C),
    ];

    // Calculate the color index based on the sequence length
    int colorIndex = index % colorSequence.length;

    // Return the color from the sequence
    return colorSequence[colorIndex];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      height: getScreenHeight(context) * 0.33,
      width: getScreenWidth(context),
      alignment: Alignment.center,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child: isBusy
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GridView.builder(
              controller: _controller,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(
                vertical: 5,
                // horizontal: 10,
              ),
              physics: const AlwaysScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, crossAxisSpacing: 1, mainAxisExtent: 90),
              itemCount: _getCategories().length,
              itemBuilder: (BuildContext ctx, index) {
                var item = _getCategories()[index];
                var color = getColorBasedOnIndex(index);
                return GestureDetector(
                  onTap: () async {
                    await Get.toNamed(Routers.doctors,
                        parameters: {"name": item.name!});
                    controller.fetchTelemedSession();
                    Get.delete<DoctorController>();
                  },
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundColor: color.withOpacity(0.18),
                        child: Image.asset("assets/images/${item.name}.png",
                            color: color,
                            errorBuilder: (ctx, error, stackTrace) =>
                                Image.asset(
                                  'assets/images/Cardiology.png',
                                  color: color,
                                )),
                      ),
                      Text(
                        item.name!,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12),
                        maxLines: 2,
                      ),
                    ],
                  ),
                );
              }),
    );
  }
}
