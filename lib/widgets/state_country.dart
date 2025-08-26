// import 'package:flutter/material.dart';
// import 'package:csc_picker/csc_picker.dart';

// class USACscPicker extends StatefulWidget {
//   const USACscPicker({Key? key}) : super(key: key);

//   @override
//   _USACscPickerState createState() => _USACscPickerState();
// }

// class _USACscPickerState extends State<USACscPicker> {
//   String? countryValue = "United States";
//   String? stateValue;
//   String? cityValue;

//   // Map of US State full names to abbreviations
//   final Map<String, String> stateAbbreviations = {
//     "Alabama": "AL",
//     "Alaska": "AK",
//     "Arizona": "AZ",
//     "Arkansas": "AR",
//     "California": "CA",
//     "Colorado": "CO",
//     "Connecticut": "CT",
//     "Delaware": "DE",
//     "Florida": "FL",
//     "Georgia": "GA",
//     "Hawaii": "HI",
//     "Idaho": "ID",
//     "Illinois": "IL",
//     "Indiana": "IN",
//     "Iowa": "IA",
//     "Kansas": "KS",
//     "Kentucky": "KY",
//     "Louisiana": "LA",
//     "Maine": "ME",
//     "Maryland": "MD",
//     "Massachusetts": "MA",
//     "Michigan": "MI",
//     "Minnesota": "MN",
//     "Mississippi": "MS",
//     "Missouri": "MO",
//     "Montana": "MT",
//     "Nebraska": "NE",
//     "Nevada": "NV",
//     "New Hampshire": "NH",
//     "New Jersey": "NJ",
//     "New Mexico": "NM",
//     "New York": "NY",
//     "North Carolina": "NC",
//     "North Dakota": "ND",
//     "Ohio": "OH",
//     "Oklahoma": "OK",
//     "Oregon": "OR",
//     "Pennsylvania": "PA",
//     "Rhode Island": "RI",
//     "South Carolina": "SC",
//     "South Dakota": "SD",
//     "Tennessee": "TN",
//     "Texas": "TX",
//     "Utah": "UT",
//     "Vermont": "VT",
//     "Virginia": "VA",
//     "Washington": "WA",
//     "West Virginia": "WV",
//     "Wisconsin": "WI",
//     "Wyoming": "WY",
//   };

//   @override
//   Widget build(BuildContext context) {
//     return CSCPicker(
//       defaultCountry: CscCountry.United_States,

//       disableCountry: true, // lock country to USA
//       onCountryChanged: (value) {
//         countryValue = value;
//       },
//       onStateChanged: (value) {
//         setState(() {
//           stateValue = value;
//           print(stateValue);
//         });
//       },
//       onCityChanged: (value) {
//         setState(() {
//           cityValue = value;
//           print(cityValue);
//         });
//       },
//     );
//   }

//   String? getStateAbbreviation() {
//     if (stateValue != null && stateAbbreviations.containsKey(stateValue)) {
//       return stateAbbreviations[stateValue];
//     }
//     return null;
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:csc_picker/csc_picker.dart';

// class USACscPicker extends StatefulWidget {
//   final String? onStateSelected; // Returns state abbreviation (e.g., "CA")
//   final String? onCitySelected;

//   const USACscPicker({
//     Key? key,
//     this.onStateSelected,
//     this.onCitySelected,
//   }) : super(key: key);

//   @override
//   _USACscPickerState createState() => _USACscPickerState();
// }

// class _USACscPickerState extends State<USACscPicker> {
//   String? countryValue = "United States";
//   String? stateValue;
//   String? cityValue;
//   String? displayedStateValue; // This will show the abbreviation

//   // Map of US State full names to abbreviations
//   final Map<String, String> stateAbbreviations = {
//     "Alabama": "AL",
//     "Alaska": "AK",
//     "Arizona": "AZ",
//     "Arkansas": "AR",
//     "California": "CA",
//     "Colorado": "CO",
//     "Connecticut": "CT",
//     "Delaware": "DE",
//     "Florida": "FL",
//     "Georgia": "GA",
//     "Hawaii": "HI",
//     "Idaho": "ID",
//     "Illinois": "IL",
//     "Indiana": "IN",
//     "Iowa": "IA",
//     "Kansas": "KS",
//     "Kentucky": "KY",
//     "Louisiana": "LA",
//     "Maine": "ME",
//     "Maryland": "MD",
//     "Massachusetts": "MA",
//     "Michigan": "MI",
//     "Minnesota": "MN",
//     "Mississippi": "MS",
//     "Missouri": "MO",
//     "Montana": "MT",
//     "Nebraska": "NE",
//     "Nevada": "NV",
//     "New Hampshire": "NH",
//     "New Jersey": "NJ",
//     "New Mexico": "NM",
//     "New York": "NY",
//     "North Carolina": "NC",
//     "North Dakota": "ND",
//     "Ohio": "OH",
//     "Oklahoma": "OK",
//     "Oregon": "OR",
//     "Pennsylvania": "PA",
//     "Rhode Island": "RI",
//     "South Carolina": "SC",
//     "South Dakota": "SD",
//     "Tennessee": "TN",
//     "Texas": "TX",
//     "Utah": "UT",
//     "Vermont": "VT",
//     "Virginia": "VA",
//     "Washington": "WA",
//     "West Virginia": "WV",
//     "Wisconsin": "WI",
//     "Wyoming": "WY",
//   };

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         CSCPicker(
//           defaultCountry: CscCountry.United_States,
//           disableCountry: true, // lock country to USA
//           onCountryChanged: (value) {
//             countryValue = value;
//           },
//           onStateChanged: (value) {
//             setState(() {
//               stateValue = value;
//               displayedStateValue = getStateAbbreviation();

//               // Call your callback with abbreviation or full name, depending on what you want
//               widget.onStateSelected = displayedStateValue;

//               print("Full state name: $stateValue");
//               print("State abbreviation: $displayedStateValue");
//             });
//           },

//           onCityChanged: (value) {
//             setState(() {
//               cityValue = value;

//               widget.onStateSelected = cityValue;

//               print("City: $cityValue");
//             });
//           },
//         ),
//         if (displayedStateValue != null)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Selected State: $displayedStateValue",
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//         if (cityValue != null)
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Selected City: $cityValue",
//               style: TextStyle(fontSize: 16),
//             ),
//           ),
//       ],
//     );
//   }

//   String? getStateAbbreviation() {
//     if (stateValue != null && stateAbbreviations.containsKey(stateValue)) {
//       return stateAbbreviations[stateValue];
//     }
//     return null;
//   }

//   // Getter methods to access the values from outside
//   String? get selectedCountry => countryValue;
//   String? get selectedState => stateValue; // returns full name
//   String? get selectedStateAbbreviation =>
//       displayedStateValue; // returns abbreviation
//   String? get selectedCity => cityValue;
// }

import 'package:flutter/material.dart';
import 'package:csc_picker/csc_picker.dart';

class USACscPicker extends StatefulWidget {
  final ValueChanged<Map<String, String?>>?
      onLocationChanged; // Combined callback

  const USACscPicker({
    Key? key,
    this.onLocationChanged,
  }) : super(key: key);

  @override
  _USACscPickerState createState() => _USACscPickerState();
}

class _USACscPickerState extends State<USACscPicker> {
  String? countryValue = "United States";
  String? stateValue;
  String? cityValue;
  String? displayedStateValue;

  final Map<String, String> stateAbbreviations = {
    "Alabama": "AL",
    "Alaska": "AK",
    "Arizona": "AZ",
    "Arkansas": "AR",
    "California": "CA",
    "Colorado": "CO",
    "Connecticut": "CT",
    "Delaware": "DE",
    "Florida": "FL",
    "Georgia": "GA",
    "Hawaii": "HI",
    "Idaho": "ID",
    "Illinois": "IL",
    "Indiana": "IN",
    "Iowa": "IA",
    "Kansas": "KS",
    "Kentucky": "KY",
    "Louisiana": "LA",
    "Maine": "ME",
    "Maryland": "MD",
    "Massachusetts": "MA",
    "Michigan": "MI",
    "Minnesota": "MN",
    "Mississippi": "MS",
    "Missouri": "MO",
    "Montana": "MT",
    "Nebraska": "NE",
    "Nevada": "NV",
    "New Hampshire": "NH",
    "New Jersey": "NJ",
    "New Mexico": "NM",
    "New York": "NY",
    "North Carolina": "NC",
    "North Dakota": "ND",
    "Ohio": "OH",
    "Oklahoma": "OK",
    "Oregon": "OR",
    "Pennsylvania": "PA",
    "Rhode Island": "RI",
    "South Carolina": "SC",
    "South Dakota": "SD",
    "Tennessee": "TN",
    "Texas": "TX",
    "Utah": "UT",
    "Vermont": "VT",
    "Virginia": "VA",
    "Washington": "WA",
    "West Virginia": "WV",
    "Wisconsin": "WI",
    "Wyoming": "WY",
  };

  void _emitLocation() {
    if (displayedStateValue != null &&
        cityValue != null &&
        widget.onLocationChanged != null) {
      widget.onLocationChanged!({
        'state': displayedStateValue,
        'city': cityValue,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CSCPicker(
          defaultCountry: CscCountry.United_States,
          disableCountry: true,
          onCountryChanged: (value) => countryValue = value,
          onStateChanged: (value) {
            setState(() {
              stateValue = value;
              displayedStateValue = getStateAbbreviation();
              _emitLocation(); // Emit both values when state changes
            });
          },
          onCityChanged: (value) {
            setState(() {
              cityValue = value;
              _emitLocation(); // Emit both values when city changes
            });
          },
        ),
      ],
    );
  }

  String? getStateAbbreviation() {
    return stateValue != null ? stateAbbreviations[stateValue] : null;
  }
}
