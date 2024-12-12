import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/utils/util.dart';
import 'package:virualapi/widgets/misc_widget.dart';

class PaymentCard extends StatelessWidget {
  final Map<String, dynamic> item;
  const PaymentCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item["doctorName"],
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Poppins',
                      color: Colors.black45),
                ),
                Container(
                  height: 4,
                  width: 30,
                  decoration: BoxDecoration(
                    color: COLOR_ACCENT,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
                AppSpacerH(10),
                Row(
                  children: [
                    Icon(Icons.calendar_month, size: 16, color: Colors.black38),
                    AppSpacerW(10),
                    Text(
                      Util.timeStampDateFormat(item["createdDate"]),
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.black45,
                          fontFamily: 'Poppins'),
                    )
                  ],
                ),
                AppSpacerH(5),
                Text(
                  item["category"],
                  style: TextStyle(
                      fontSize: 15,
                      color: COLOR_PRIMARY,
                      fontFamily: 'Poppins'),
                ),
              ],
            ),
            Column(
              children: [
                Text(
                  "${item['txCurrency']}${item['amount']}",
                  style: TextStyle(
                      fontSize: 16,
                      color: COLOR_GRAY,
                      fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3.0),
                  child: Text(
                    item["processorId"],
                    style: TextStyle(
                        fontSize: 14,
                        color: COLOR_ACCENT,
                        fontFamily: 'Poppins'),
                  ),
                ),
                Text(
                  item["status"],
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.black45,
                      fontFamily: 'Poppins'),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
