import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReusableWidget {
  static loadSvg(String path, {double? height, Color? color}) {
    return SvgPicture.asset(
      path,
      height: height,

      // colorFilter: ColorFilter.mode(Colors.red, BlendMode.srcIn),
      color: color,
      //colorFilter: color != null ? ColorFilter.mode(color, BlendMode.src) : null,
    );
  }

  static loadImageFromNetwork(
    String url, {
    double? height,
    double? width,
    BoxFit boxFit = BoxFit.cover,
  }) {
    return CachedNetworkImage(
        imageUrl: url,
        height: height,
        width: width,
        fit: boxFit,
        placeholder: (context, url) => CircularProgressIndicator(),
        errorWidget: (context, url, error) => Icon(Icons.error));
  }

  // static appBar({
  //   required BuildContext context,
  //   required String titleText,
  //   bool transparent = false,
  // }) {
  //   return AppBar(
  //     elevation: 0,
  //     backgroundColor: transparent ? Colors.transparent : AppColors.darkBlue,
  //     centerTitle: true,
  //     leading: IconButton(
  //       onPressed: () {
  //         Navigator.pop(context);
  //       },
  //       icon: const Icon(Icons.arrow_back_ios_new),
  //     ),
  //     title: Text(
  //       titleText,
  //       style: AppTextStyle.regularTitleTextStyle(
  //         context: context,
  //         fontSize: AppFontSize.fontSize20,
  //         color: AppColors.white,
  //       ),
  //     ),
  //   );
  // }

  // static noDataFoundWidget({
  //   required BuildContext context,
  //   String? text,
  //   EdgeInsetsGeometry? margin,
  // }) {
  //   return Padding(
  //     padding: margin ??
  //         const EdgeInsets.symmetric(
  //           vertical: AppPadding.padding26,
  //         ),
  //     child: Text(
  //       text ?? AppString.noDataFound,
  //       style: AppTextStyle.mediumTitleTextStyle(
  //         context: context,
  //         color: AppColors.white,
  //       ),
  //     ),
  //   );
  // }

  // static noDataFoundWidgetCustom({
  //   required BuildContext context,
  //   String? text,
  //   String? icon,
  //   EdgeInsetsGeometry? margin,
  //   MainAxisAlignment mainAxisAlignment = MainAxisAlignment.center,
  // }) {
  //   return Column(
  //     mainAxisSize: MainAxisSize.max,
  //     mainAxisAlignment: mainAxisAlignment,
  //     children: [
  //       if (margin != null) ...[
  //         Padding(
  //           padding: margin,
  //         ),
  //       ],
  //       if (icon != null) ...[
  //         Container(
  //             width: AppPadding.padding80,
  //             height: AppPadding.padding80,
  //             decoration: const BoxDecoration(
  //               color: AppColors.darkGray,
  //               borderRadius: BorderRadius.all(
  //                 Radius.circular(
  //                   AppPadding.padding40,
  //                 ),
  //               ),
  //             ),
  //             child: Center(
  //               child: SizedBox(
  //                 height: AppPadding.padding60,
  //                 child: loadSvg(icon),
  //               ),
  //             )),
  //         const SizedBox(
  //           height: AppPadding.padding10,
  //         )
  //       ],
  //       SizedBox(
  //         width: AppPadding.padding205,
  //         child: Text(
  //           textAlign: TextAlign.center,
  //           text ?? AppString.noDataFound,
  //           style: AppTextStyle.subTitleTextStyle(
  //             fontSize: 14,
  //             context: context,
  //             color: AppColors.white,
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }

  // static inviteFriendWidget({required BuildContext context}) {
  //   return Stack(
  //     clipBehavior: Clip.none,
  //     children: [
  //       AppButton(
  //         label: AppString.inviteFriends,
  //         onPress: () async {
  //           String appUrl = 'https://thegogirlapp.com/';
  //           if (Platform.isAndroid) {
  //             //appUrl = 'https://play.google.com/store';
  //           } else if (Platform.isIOS) {
  //             //appUrl = 'https://www.apple.com/in/app-store';
  //           }
  //           await Share.share(
  //             appUrl,
  //             subject: 'Application Link',
  //           );
  //         },
  //         boxConstraints: const BoxConstraints(
  //           /* maxWidth: 189,
  //           minWidth: 189,*/
  //           maxHeight: AppPadding.padding35,
  //           minHeight: AppPadding.padding35,
  //         ),
  //         padding: const EdgeInsets.symmetric(
  //           horizontal: AppPadding.padding10,
  //         ),
  //         labelStyle: AppTextStyle.boldTitleTextStyle(
  //           context: context,
  //           fontSize: AppFontSize.fontSize18,
  //           color: Colors.white,
  //         ),
  //         iconWidget: ReusableWidget.loadSvg(
  //           AppIcon.myBesties,
  //           color: Colors.white,
  //         ),
  //       ),

  //       /* Positioned(
  //         right: 6,
  //         top: -14,
  //         child: Image.asset(
  //           AppIcon.icInviteFriendTopIcon
  //         ),
  //       ),

  //       Positioned(
  //         left: 0,
  //         bottom: -14,
  //         child: Image.asset(
  //             AppIcon.icInviteFriendBottomIcon,
  //         ),
  //       ),*/
  //     ],
  //   );
  // }
}
