// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomSheetController extends GetxController {
  bool isStatOnly = false;

  final Set<String> selectedSorts = {};
  final TextEditingController dateController = TextEditingController();
  final TextEditingController patientNameController = TextEditingController();
  final TextEditingController accessionController = TextEditingController();
  final TextEditingController orderNumberController = TextEditingController();

  int get selectedCount => [
    patientNameController,
    dateController,
    accessionController,
    orderNumberController,
  ].where((c) => c.text.trim().isNotEmpty).length;

  void toggleSort(String key) {
    if (selectedSorts.contains(key)) {
      selectedSorts.remove(key);
    } else {
      selectedSorts.add(key);
    }
    update();
  }

  void clearBottomSheet() {
    selectedSorts.clear();
    patientNameController.clear();
    dateController.clear();
    accessionController.clear();
    orderNumberController.clear();
    isStatOnly = false;
    update();
  }

  Future<void> pickDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      dateController.text = "${picked.day}/${picked.month}/${picked.year}";
      update();
    }
  }

  int activeCount() => (selectedCount + (isStatOnly ? 1 : 0));

  @override
  void onClose() {
    super.onClose();
    patientNameController.dispose();
    accessionController.dispose();
    orderNumberController.dispose();
    dateController.dispose();
  }
}
