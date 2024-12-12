import 'package:flutter/material.dart';

class MedicalDropDown extends StatelessWidget {
  final String icon;
  final String title;
  final String units;
  final int maxCount;
  final String? value;
  final void Function(String?)? onChanged;

  //For 2nd drop down
  final String? units1;
  final int? maxCount1;
  final String? value1;
  final void Function(String?)? onChanged1;

  const MedicalDropDown({
    super.key,
    required this.icon,
    required this.title,
    required this.units,
    required this.value,
    required this.maxCount,
    required this.onChanged,
    this.value1,
    this.units1,
    this.maxCount1,
    this.onChanged1,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            SizedBox(width: 25, height: 30, child: Image.asset(icon)),
            SizedBox(
              width: 10,
            ),
            Text(
              title,
              style: TextStyle(fontFamily: 'Poppinssb', color: Colors.black45),
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "(Optional)",
              style: TextStyle(
                  fontFamily: 'Poppinsl', color: Colors.black38, fontSize: 12),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 35),
          child: Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                    icon: Row(
                      children: [
                        Text(
                          units,
                          style: TextStyle(
                              fontSize: 10,
                              color: Colors.black26,
                              fontFamily: 'Poppinsl'),
                        ),
                        SizedBox(width: 20),
                        Image.asset("assets/images/drop_down.png")
                      ],
                    ),
                    underline: SizedBox(),
                    isExpanded: true,
                    value: value,
                    items: List.generate(maxCount, (index) => index)
                        .toList()
                        .map<DropdownMenuItem<String>>((int value) {
                      var val = (value + 1).toString();
                      return DropdownMenuItem<String>(
                        value: val,
                        child: Text(val),
                      );
                    }).toList(),
                    onChanged: onChanged),
              ),
              if (maxCount1 != null) SizedBox(width: 30),
              if (maxCount1 != null)
                Expanded(
                  child: DropdownButton<String>(
                      icon: Row(
                        children: [
                          Text(
                            units1!,
                            style: TextStyle(
                                fontSize: 10,
                                color: Colors.black26,
                                fontFamily: 'Poppinsl'),
                          ),
                          SizedBox(width: 20),
                          Image.asset("assets/images/drop_down.png")
                        ],
                      ),
                      underline: SizedBox(),
                      isExpanded: true,
                      value: value1,
                      items: List.generate(maxCount, (index) => index)
                          .toList()
                          .map<DropdownMenuItem<String>>((int value) {
                        var val = (value + 1).toString();
                        return DropdownMenuItem<String>(
                          value: val,
                          child: Text(val),
                        );
                      }).toList(),
                      onChanged: onChanged1),
                ),
            ],
          ),
        )
      ],
    );
  }
}
