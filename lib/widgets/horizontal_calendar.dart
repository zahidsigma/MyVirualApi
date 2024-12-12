import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';

class HorizontalCalendar extends StatefulWidget {
  final Function(DateTime)? onChanged;
  const HorizontalCalendar({Key? key, this.onChanged}) : super(key: key);

  @override
  State<HorizontalCalendar> createState() => _HorizontalCalendarState();
}

class _HorizontalCalendarState extends State<HorizontalCalendar> {
  late DateTime firstDayOfMonth;
  late DateTime lastDayOfMonth;
  late ScrollController _scrollController;
  int selectedIndex = 0;
  List<int> calendarList = [];
  List<Map<String, dynamic>> months = [];
  Map<String, dynamic>? month;

  void _scrollToSelectedIndex() {
    _scrollController.animateTo(
      selectedIndex * 64.0, // Adjust 68.0 based on your item width
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollToToday(index) async {
    await Future.delayed(Duration(milliseconds: 100));
    setState(() {
      selectedIndex = index;
      _scrollToSelectedIndex();
    });
  }

  // _addDays(int month) {
  //   firstDayOfMonth =
  //       DateTime.now().subtract(Duration(days: DateTime.now().day - 1));
  //   lastDayOfMonth =
  //       DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0);
  //   _scrollController = ScrollController();
  //   List.generate(lastDayOfMonth.day - DateTime.now().day, (index) {
  //     var day = DateTime.now().day + index;
  //     calendarList.add(day);
  //     final currentDate = firstDayOfMonth.add(Duration(days: day));
  //     if (DateFormat(DateFormat.yMEd().pattern).format(currentDate) ==
  //         DateFormat(DateFormat.yMEd().pattern).format(DateTime.now())) {
  //       _scrollToToday(index);
  //     }
  //   });
  // }

  _addDays(int month) {
    calendarList.clear();
    DateTime today = DateTime.now();

    if (month == today.month) {
      firstDayOfMonth = DateTime(today.year, today.month, today.day);
    } else {
      firstDayOfMonth = DateTime(today.year, month, 1);
    }

    // Get the last day of the month using DateTime. daysInMonth
    final lastDayOfMonth = DateTime(firstDayOfMonth.year, firstDayOfMonth.month,
        DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0).day);

    _scrollController = ScrollController();
    List.generate(lastDayOfMonth.difference(firstDayOfMonth).inDays + 1,
        (index) {
      final currentDate = firstDayOfMonth.add(Duration(days: index));
      calendarList.add(index);
      if (DateFormat(DateFormat.yMEd().pattern).format(currentDate) ==
          DateFormat(DateFormat.yMEd().pattern).format(today)) {
        _scrollToToday(index);
      }
    });
  }

  // _addDays(int month) {
  //   calendarList.clear();
  //   DateTime today = DateTime.now();
  //   if (month == today.month) {
  //     // Use the current month
  //     firstDayOfMonth = DateTime(today.year, today.month, today.day);
  //   } else {
  //     // Use the specified month
  //     firstDayOfMonth = DateTime(today.year, month, 1);
  //   }

  //   lastDayOfMonth =
  //       DateTime(firstDayOfMonth.year, firstDayOfMonth.month + 1, 0);
  //   _scrollController = ScrollController();

  //   List.generate((lastDayOfMonth.day - firstDayOfMonth.day) + 1, (index) {
  //     // var day = firstDayOfMonth.day + index;
  //     calendarList.add(index);

  //     final currentDate = firstDayOfMonth.add(Duration(days: index));
  //     if (DateFormat(DateFormat.yMEd().pattern).format(currentDate) ==
  //         DateFormat(DateFormat.yMEd().pattern).format(today)) {
  //       _scrollToToday(index);
  //     }
  //   });
  // }

  _addMonths() {
    for (var i = 0; i < 3; i++) {
      var now = DateTime.now();
      var _month = now.add(Duration(days: i * 30));
      months.add({
        "month": DateFormat("MMMM").format(_month),
        "year": _month.year,
        "MM": _month.month
      });
    }
    setState(() {
      month = months[0];
    });
  }

  _onMonthSelected(Map<String, dynamic> item) {
    setState(() {
      month = item;
    });

    _addDays(item["MM"]);
    var now = DateTime.now();
    if (item["MM"] != now.month) {
      widget.onChanged?.call(DateTime(item["year"], item["MM"], 1));
      setState(() {
        selectedIndex = 0;
      });
    } else {
      widget.onChanged?.call(now);
    }

    Future.delayed(Duration(milliseconds: 500))
        .then((value) => _scrollToSelectedIndex());
  }

  @override
  void initState() {
    super.initState();
    _addDays(DateTime.now().month);
    _addMonths();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Align(
          alignment: Alignment.bottomRight,
          child: PopupMenuButton<Map<String, dynamic>>(
            initialValue: month,
            onSelected: _onMonthSelected,
            // position: PopupMenuPosition.under,
            itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<Map<String, dynamic>>>[
              ...months.map<PopupMenuItem<Map<String, dynamic>>>(
                  (e) => PopupMenuItem<Map<String, dynamic>>(
                        value: e,
                        child: Text("${e['month']} ${e['year']}"),
                      ))
            ],
            child: Row(mainAxisSize: MainAxisSize.min, children: [
              Icon(
                Icons.chevron_left,
                color: COLOR_ACCENT_LIGHT,
                size: 30,
              ),
              Text(
                "${month!['month']} ${month!['year']}",
                style: TextStyle(fontSize: 15, color: COLOR_ACCENT_LIGHT),
              ),
              Icon(
                Icons.chevron_right,
                color: COLOR_ACCENT_LIGHT,
                size: 30,
              ),
            ]),
          ),
        ),
        const SizedBox(height: 16.0),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          physics: const ClampingScrollPhysics(),
          controller: _scrollController,
          child: Row(
            children: calendarList.map(
              (index) {
                final currentDate = firstDayOfMonth.add(Duration(days: index));
                bool isSelected = selectedIndex == index;
                return Padding(
                  padding: EdgeInsets.only(
                      left: index == 0 ? 16.0 : 0.0, right: 16.0),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      selectedIndex = index;
                      _scrollToSelectedIndex();
                      widget.onChanged?.call(currentDate);
                    }),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: 3, right: 3, top: 2, bottom: 10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: isSelected
                              ? const Color(0xFFe59e20)
                              : Colors.transparent),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 42.0,
                            width: 42.0,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFF517789),
                              borderRadius: BorderRadius.circular(44.0),
                            ),
                            child: Text(
                              DateFormat('dd').format(currentDate),
                              style: TextStyle(
                                fontSize: 18.0,
                                color: isSelected ? COLOR_ACCENT : Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8.0),
                          Text(
                            DateFormat('EEE').format(currentDate),
                            style: TextStyle(
                              fontSize: 16.0,
                              color: isSelected
                                  ? Colors.white
                                  : const Color(0xFFbccbd3),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ).toList(),
          ),
        ),
      ],
    );
  }
}
