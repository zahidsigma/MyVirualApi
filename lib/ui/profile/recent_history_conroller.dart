import 'package:get/get.dart';
import 'package:virualapi/models/search_history.dart';
// ✅ Add this
import 'package:virualapi/repos/misc_repo.dart';
import 'package:virualapi/utils/snackbar_util.dart';
import 'package:virualapi/core/routing/router_str.dart';

class RecentHistoryController extends GetxController {
  RxBool isBusy = false.obs;
  final _miscRepo = Get.find<MiscRepository>();
  Rx<OrderData?> selectedOrder = Rx<OrderData?>(null);

  RxList<OrderData> dataList = <OrderData>[].obs;

  @override
  void onInit() {
    super.onInit();
    getSearchHistory();
  }

  getSearchHistory() async {
    isBusy.value = true;

    var result = await _miscRepo.getSearchHistory();
    isBusy.value = false;

    result.fold((failure) {
      SnackbarUtil.error(
        logMessage: failure.errorMessage.toString(),
        logScreenName: Routers.profile,
        logMethodName: 'GetRecentHistory',
        message: failure.errorMessage.toString(),
      );
    }, (r) {
      print("🔹 Search History Response:");
      print("Status: ${r.status}");
      print("Message: ${r.message}");
      for (var order in r.data) {
        print(
            "ID: ${order.id}, Name: ${order.firstName} ${order.lastName}, Total: \$${order.total}");
        for (var report in order.reports) {
          print(" - Report: ${report.label}, Price: ${report.price}");
        }
        print("Links: ${order.reportLinks}");
      }
      dataList.value = r.data.reversed.toList(); // ✅ Use r.data
    });
  }

  void clearSelection() {
    selectedOrder.value = null;
  }
}
