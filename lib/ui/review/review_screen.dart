import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/core/routing/router_str.dart';
import 'package:virualapi/repos/appointment_repo.dart';
import 'package:virualapi/services/singleton.dart';
import 'package:virualapi/ui/home/home_controller.dart';
import 'package:virualapi/ui/home/widgets/title.dart';
import '../../../core/error/failure.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/widgets/body_with_header.dart';
import 'package:virualapi/widgets/button.dart';
import 'package:virualapi/widgets/misc_widget.dart';
import 'package:collection/collection.dart';

enum RatingType {
  VideoQuality,
  DoctorSkills,
  CareQuality,
  ServiceEndorsement,
}

class ReviewScreen extends StatelessWidget {
  ReviewScreen({super.key});

  final ratings = [
    {
      "title": "Video Quality",
      "type": RatingType.VideoQuality,
      "rating": 1,
    },
    {
      "title": "Doctor Skills",
      "type": RatingType.DoctorSkills,
      "rating": 1,
    },
    {
      "title": "Care Quality",
      "type": RatingType.CareQuality,
      "rating": 1,
    },
    {
      "title": "Service Endorsement",
      "type": RatingType.ServiceEndorsement,
      "rating": 1,
    },
  ];

  submitRating() {
    Map<String, dynamic> payload = {};
    var session = Singleton.instance.session;
    payload["stars"] = ratings[1]["rating"];
    var feedback = ratings
        .map((element) => "${element["title"]}: ${element['rating']}/5")
        .join(" | ");
    payload["feedback"] = feedback;
    payload["reviewee_name"] = session["doctorName"];
    payload["reviewee_id"] = session["doctorId"];
    payload["createdBy"] = session["requestedBy"];
    payload["reviewee_role"] = 'ROLE_CARE_PROVIDER';
    saveAndUpdateSession(payload, session["sessionId"]);
    // print(payload);
    // print(session);
  }

  saveAndUpdateSession(payload, sessionId) async {
    //65b67b4d13e992457bc15b9f
    var appointmentRepo = Get.find<AppointmentRepository>();
    var result = await appointmentRepo.saveSession(data: payload);

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: (failure as Error).errorMessage.toString(),
        logScreenName: Routers.reviewScreen,
        logMethodName: 'login',
        message: (failure).errorMessage.toString(),
      );
    }, (r) async {
      var result = await appointmentRepo.updateSession(
          sessionId: sessionId, data: {"userFeedbackId": r["recordId"]});
      result.fold(
        (failure) {
          SnackbarUtil.error(
            logMessage: (failure as Error).errorMessage.toString(),
            logScreenName: Routers.login,
            logMethodName: 'login',
            message: (failure).errorMessage.toString(),
          );
        },
        (r) {
          var homeCtrl = Get.find<HomeController>();
          homeCtrl.getUpcomingAppts();
          Get.offAndToNamed(Routers.homeScreen);
          SnackbarUtil.info(message: r["message"], isInfo: false);
          Future.delayed(Duration(seconds: 1))
              .then((value) => homeCtrl.getUpcomingAppts());
          // Future.delayed(Duration(seconds: 1)).then((value) {
          //   if (Get.routeTree.routes.contains(Routers.reviewScreen)) {
          //     Get.back();
          //   }
          // });
        },
      );
    });
  }

  _renderRatingView(title, type, index) =>
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        AppSpacerH(15),
        Text(
          title,
          style: TextStyle(
              color: COLOR_GRAY, fontSize: 16, fontWeight: FontWeight.w700),
        ),
        AppSpacerH(5),
        RatingBar.builder(
          initialRating: 1,
          minRating: 1,
          direction: Axis.horizontal,
          allowHalfRating: false,
          itemCount: 5,
          itemSize: 30,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            ratings[index]["rating"] = rating.toInt();
            print(ratings);
            // let index = ratings.fi
          },
        ),
        Divider(),
      ]);

  @override
  Widget build(BuildContext context) {
    return BodyWithHeader(
        body: Padding(
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          AppSpacerH(20),
          HomeTitle(
            title: "Feedback",
          ),
          AppSpacerH(10),
          Text(
            "Share your feedback by rating the following questions:",
            style: TextStyle(fontSize: 14, color: COLOR_GRAY),
          ),
          AppSpacerH(20),
          ...ratings.mapIndexed(
              (index, e) => _renderRatingView(e["title"], e["type"], index)),
          AppSpacerH(20),
          Button(
              title: "Submit",
              onPressed: submitRating,
              backgroundColor: COLOR_ACCENT)
        ],
      ),
    ));
  }
}
