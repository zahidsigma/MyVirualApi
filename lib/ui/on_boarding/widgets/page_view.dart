import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:virualapi/services/navigator_service.dart';
import 'package:virualapi/ui/auth/login/login_page.dart';
import 'package:virualapi/ui/on_boarding/widgets/page_view_item.dart';
import 'package:virualapi/widgets/misc_widget.dart';

import '../../../constants/constant.dart';
import '../../../utils/metrics.dart';
import '../../../widgets/button.dart';

// import '../../../constants/constant.dart';
// import '../../../utils/metrics.dart';
// import '../../../widgets/Indicator.dart';
// import 'page_view_item.dart';

class MyPageView extends StatefulWidget {
  const MyPageView({super.key});

  @override
  State<MyPageView> createState() => _MyPageViewState();
}

class _MyPageViewState extends State<MyPageView> {
  final _pageController = PageController();
  double currentPage = 0;

  @override
  void initState() {
    //page controller is always listening
    //every pageview is scrolled sideways it will take the index page
    _pageController.addListener(() {
      setState(() {
        currentPage = _pageController.page!.toDouble();
        print(currentPage);
      });
    });
    super.initState();
  }

  void _onPressed() {
    if (currentPage != onBoardingList.length - 1) {
      _pageController.nextPage(
          duration: Duration(milliseconds: 500), curve: Curves.easeInOut);
    } else {
      pushAndRemoveUntil(context, LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLast = currentPage == onBoardingList.length - 1;
    return SafeArea(
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                pushAndRemoveUntil(context, LoginScreen());
              },
              child: Text(
                isLast ? "" : "Skip",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Poppinsb', fontSize: 15, color: COLOR_GRAY),
              ),
            ),
          ),
          Expanded(
            child: PageView.builder(
              itemBuilder: (context, index) => PageViewItem(
                item: onBoardingList[index],
                isLast: index == onBoardingList.length - 1,
                controller: _pageController,
                currentPage: currentPage,
              ),
              controller: _pageController,
              itemCount: onBoardingList.length,
              onPageChanged: (int index) {
                setState(() {
                  currentPage = index.toDouble();
                });
              },
            ),
          ),
          AppSpacerH(15.h),
          Button(
            title: isLast ? "GET STARTED" : "NEXT",
            onPressed: () => _onPressed(),
            height: 55,
            width: !isLast ? getScreenWidth(context) * 0.4 : null,
            // backgroundColor: isLast ? COLOR_PRIMARY : COLOR_ACCENT,
            backgroundColor: COLOR_PRIMARY,
          ),
          AppSpacerH(5.h),
        ],
      ),
    );
  }
}
