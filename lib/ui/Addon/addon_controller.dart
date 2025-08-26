import 'package:get/get.dart';
import 'package:virualapi/models/dynamic_price.dart';
import 'package:virualapi/repos/misc_repo.dart';

class AddonController extends GetxController {
  final Map<String, int> indicators;
  AddonController({required this.indicators});

  // Observable state
  var isLoading = true.obs;
  var errorMessage = RxnString();
  var fields = <PricingType>[].obs; // Use PricingType model here
  var selectedIndicators = <String, bool>{}.obs;

  final _miscRepo = Get.find<MiscRepository>();

  @override
  void onInit() {
    super.onInit();
    fetchFieldsFromApi();
  }

  Future<void> fetchFieldsFromApi() async {
    try {
      isLoading.value = true;
      errorMessage.value = null;

      var result = await _miscRepo.getPricing();

      result.fold(
        (failure) {
          errorMessage.value = failure.errorMessage;
        },
        (PricingResponse pricingResponse) {
          // Use your PricingResponse model here
          fields.value = pricingResponse.data.types;

          // Initialize selectedIndicators for indicators keys existing in fields
          selectedIndicators.value = {
            for (var entry in indicators.entries)
              if (entry.value > 0 &&
                  fields.any((field) => field.key == entry.key))
                entry.key: false,
          };
        },
      );
    } catch (e) {
      errorMessage.value = "Error: $e";
    } finally {
      isLoading.value = false;
    }
  }

  void toggleIndicator(String key, bool value) {
    selectedIndicators[key] = value;
    selectedIndicators.refresh();
  }

  List<Map<String, dynamic>> getSelectedItems() {
    return selectedIndicators.entries
        .where((entry) => entry.value)
        .map((entry) {
      // Find the PricingType by key, fallback to dummy PricingType
      final field = fields.firstWhere(
        (f) => f.key == entry.key,
        orElse: () => PricingType(
          label: entry.key,
          key: entry.key,
          price: 0,
          count: indicators[entry.key] ?? 0,
        ),
      );

      return {
        'label': field.label,
        'price': field.price,
        'count': indicators[entry.key],
        'key': entry.key,
      };
    }).toList();
  }
}
