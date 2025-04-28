import 'package:flutter/material.dart';
import 'package:virualapi/constants/constant.dart';
import 'package:virualapi/ui/compare/compare_screen.dart';

class AddonScreen extends StatefulWidget {
  final Map<String, int>? indicators;
  final String? tahoeId;

  AddonScreen({
    this.indicators,
    this.tahoeId,
  });

  @override
  _AddonScreenState createState() => _AddonScreenState();
}

class _AddonScreenState extends State<AddonScreen> {
  late Map<String, bool> selectedIndicators;

  // Fields with labels for better UI display
  // final List<Map<String, String>> fields = [
  //   {"key": "hasBankruptcyRecords", "label": "Bankruptcy Records"},
  //   {"key": "hasEvictionsRecords", "label": "Evictions Records"},
  //   //  {"key": "hasEvictionsRecords", "label": "Evictions Records"},
  //   {"key": "hasUnbankedData", "label": "Unbanked Data"},
  //   {"key": "hasMobilePhones", "label": "Mobile Phones"},
  //   {"key": "hasLandLines", "label": "Land Lines"},
  //   {"key": "hasEmails", "label": "Emails"},
  //   {"key": "hasAddresses", "label": "Addresses"},
  //   {"key": "hasCurrentAddresses", "label": "Current Addresses"},
  //   {"key": "hasHistoricalAddresses", "label": "Historical Addresses"},
  // ];
  final List<Map<String, dynamic>> fields = [
    // {"key": "hasBankruptcyRecords", "label": "Bankruptcy Records", "price": 7},
    {"key": "hasBusinessRecords", "label": "Business", "price": 3},
    {"key": "hasDivorceRecords", "label": "Divorce Records", "price": 5},
    {"key": "hasDomainsRecords", "label": "Domains Records", "price": 2},
    {"key": "hasEvictionsRecords", "label": "Evictions Records", "price": 9},
    {"key": "hasFeinRecords", "label": "Fein Records", "price": 4},
    {"key": "hasCriminalRecords", "label": "Criminal", "price": 7},
    {
      "key": "hasForeclosuresRecords",
      "label": "Foreclosures Records",
      "price": 6
    },
    // {"key": "hasJudgmentRecords", "label": "Judgment Records", "price": 1},
    // {"key": "hasLienRecords", "label": "Lien Records", "price": 8},
    {"key": "hasMarriageRecords", "label": "Marriage Records", "price": 10},
    {
      "key": "hasProfessionalLicenseRecords",
      "label": "Professional License Records",
      "price": 3
    },
    {"key": "hasPropertyRecords", "label": "Property Records", "price": 7},
    // {
    //   "key": "hasVehicleRegistrationsRecords",
    //   "label": "Vehicle Registrations Records",
    //   "price": 5
    // },
    {"key": "hasWorkplaceRecords", "label": "Workplace Records", "price": 2},
    {"key": "hasDeaRecords", "label": "DEA Records", "price": 6},
    {"key": "hasDebtRecords", "label": "Debt Records", "price": 6},
  ];
  @override
  void initState() {
    super.initState();
    // selectedIndicators = {
    //   for (var entry in widget.indicators.entries)
    //     if (entry.value > 0) entry.key: false, // Only show non-zero indicators
    // };
    print(widget?.tahoeId);

    selectedIndicators = {
      for (var entry in widget.indicators!.entries)
        if (entry.value > 0 && fields.any((field) => field["key"] == entry.key))
          entry.key: false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Full Report"),
        backgroundColor: COLOR_PRIMARY,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: selectedIndicators.isEmpty
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.warning, size: 48, color: Colors.orange),
                          SizedBox(height: 16),
                          Text(
                            'No indicators found',
                            style: TextStyle(fontSize: 18),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'This User Have No Indicators Found',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    )
                  : ListView(
                      children: selectedIndicators.keys.map((key) {
                        // Find the field or use default values
                        final field = fields.firstWhere(
                          (field) => field["key"] == key,
                          orElse: () => {
                            "key": key,
                            "label": key,
                            "price": 0,
                          },
                        );

                        String label = field["label"]!;
                        int price = field["price"] as int;
                        bool isSelected = selectedIndicators[key] ?? false;

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Row(
                            children: [
                              Checkbox(
                                value: isSelected,
                                onChanged: (bool? value) {
                                  setState(() {
                                    selectedIndicators[key] = value ?? false;
                                  });
                                },
                                activeColor: COLOR_PRIMARY,
                                checkColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(4),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Center(
                                        child: Text(
                                          "$label: ${widget.indicators![key]}",
                                          style: TextStyle(
                                            color: isSelected
                                                ? COLOR_PRIMARY
                                                : Colors.black,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(right: 16.0),
                                      child: Text(
                                        "\$$price",
                                        style: TextStyle(
                                          color: isSelected
                                              ? COLOR_PRIMARY
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
            ),
            if (selectedIndicators.isNotEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: COLOR_PRIMARY,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  final selectedItems = selectedIndicators.entries
                      .where((entry) => entry.value)
                      .map((entry) {
                    final field = fields.firstWhere(
                      (f) => f["key"] == entry.key,
                      orElse: () =>
                          {"key": entry.key, "label": entry.key, "price": 0},
                    );
                    return {
                      'label': field['label'],
                      'price': field['price'],
                      'count': widget.indicators![entry.key],
                      'key': entry.key,
                    };
                  }).toList();

                  if (selectedItems.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('This User Have No Indicators Record ')),
                    );
                    return;
                  }

                  final totalPrice = selectedItems.fold(
                      0, (sum, item) => sum + (item['price'] as int));

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CompareScreen(
                          selectedItems: selectedItems,
                          totalPrice: totalPrice,
                          tahoeId: widget.tahoeId),
                    ),
                  );
                },
                child: Text("Generate Report"),
              ),
            if (selectedIndicators.isEmpty)
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  minimumSize: Size.fromHeight(50),
                ),
                onPressed: () {
                  // Optionally navigate back or to another screen
                  Navigator.pop(context);
                },
                child: Text("Go Back"),
              ),
          ],
        ),
      ),
    );
  }
}
