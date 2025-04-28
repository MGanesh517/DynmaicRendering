import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../Controllers/common_controllers.dart';
import 'common_components.dart';

class FormComponents {
  static final FormComponents _singleton = FormComponents._internal();
  FormComponents._internal();
  static FormComponents get instance => _singleton;
  final controller = Get.put(MiniController());
  /// Helper function to create a text field with input filtering
   Widget buildTextField(BuildContext context, String title, RegExp allowedChars) {
    return CommonComponents.defaultTextField(
      context,
      title: title,
      inputFormatters: [FilteringTextInputFormatter.allow(allowedChars)],
    );
  }
  /// Helper function to create a dropdown field
  Widget buildDropdown(BuildContext context, String title, List<dynamic> items) {
    return CommonComponents.defaultDropdownSearch(
      context,
      title: title,
      items: items,
      onChanged: (value) {},
      compareFn: (i, dynamic s) => i == s,
      itemAsString: (dynamic u) => u[1].toString(),
    );
  }

  /// Helper function to create a date-time picker field
  Widget buildDateTimePicker(BuildContext context, String title) {
    return CommonComponents.defaultTextField(
      context,
      title: title,
      readOnly: true,
      controller: TextEditingController(),
      onTap: () async {
        final DateTime? pickedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );
        if (pickedDate != null) {
          final TimeOfDay? pickedTime = await showTimePicker(
            context: context,
            initialTime: TimeOfDay.fromDateTime(pickedDate),
          );
          if (pickedTime != null) {
            DateTime finalDateTime = DateTime(
                pickedDate.year, pickedDate.month, pickedDate.day, pickedTime.hour, pickedTime.minute);
            debugPrint("Selected Date & Time: $finalDateTime");
          }
        }
      },
    );
  }

  /// Helper function to create a date picker field
  Widget buildDatePicker(BuildContext context, String title) {
    return CommonComponents.defaultTextField(
      context,
      title: title,
      readOnly: true,
      onTap: () async {
        final DateTime? picked = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime.now(),
          lastDate: DateTime(2025),
        );
        if (picked != null) {
          debugPrint("Selected Date: ${picked.day}-${picked.month}-${picked.year}");
        }
      },
    );
  }

  /// Helper function to create a time picker field
  Widget buildTimePicker(BuildContext context, String title) {
    return CommonComponents.defaultTextField(
      context,
      title: title,
      readOnly: true,
      onTap: () async {
        final TimeOfDay? picked = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.now(),
        );
        if (picked != null) {
          debugPrint("Selected Time: ${picked.hour}:${picked.minute}");
        }
      },
    );
  }

  /// Helper function to create an async dropdown field (ForeignKey & ManyToMany)
  Widget buildAsyncDropdown(BuildContext context, String title, Map<String, dynamic> field, {bool isMultiSelect = false}) {
    return isMultiSelect
        ? CommonComponents.defaultMultiSelectionDropdownSearch(
      context,
      title: title,
      asyncItems: (String? filter) async => await fetchMasterList(fieldName: title),
      onChanged: (value) {},
      selectedItem: [],
      compareFn: (i, dynamic s) => i?['id'] == s?['id'],
      itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
    )
        : CommonComponents.defaultDropdownSearch(
      context,
      title: title,
      asyncItems: (String? filter) async => await fetchMasterList(fieldName: title),
      onChanged: (value) {},
      compareFn: (i, dynamic s) => i?['id'] == s?['id'],
      itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
    );
  }

  /// Function to fetch master list data
  Future<List<dynamic>> fetchMasterList({required String fieldName}) async {
    await controller.fetchMasterList(
        'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/$fieldName/');
    return controller.masterList;
  }
}