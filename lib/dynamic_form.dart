import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:test_update/Common/common_form_components.dart';
import 'package:test_update/Common/form_components.dart';

import 'Controllers/common_controllers.dart';
import 'Common/common_components.dart';

class DynamicForm extends StatefulWidget {
  const DynamicForm({super.key});

  @override
  State<DynamicForm> createState() => _DynamicFormState();
}

class _DynamicFormState extends State<DynamicForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final controller = Get.put(MiniController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("widget.title"),
      ),
      body: GetBuilder<MiniController>(
        initState: (_) => MiniController.to.initFormState(),
        builder: (value) => SingleChildScrollView(
          child: Obx(
            () {
              List<dynamic> widgetList = controller.commonFormData.results != null
                  // ? controller.commonFormData.results!.first.fields.entries.map((entry) {
                  //     return Padding(
                  //       padding: const EdgeInsets.symmetric(vertical: 8.0),
                  //       child: renderField(entry.key, entry.value, context),
                  //     );
                  //   }).toList()
                  ?controller.commonFormData.results!.map((entry) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: renderField(entry.appLabel!, entry.toJson(), context),
                );
              }).toList()
                  : [];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: widgetList.cast<Widget>(),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // Widget renderField(String fieldName, Map<String, dynamic> field, context) {
  //   switch (field['type']) {
  //     case 'Char':
  //       return CommonComponents.defaultTextField(context,
  //           title: fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[A-Z,a-z,0-9,.]'))]
  //           // hintText: field['hinttext'],
  //           );
  //     case 'Text':
  //       return CommonComponents.defaultTextField(context,
  //           title: fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[A-Z,a-z,0-9,.-/-]'))]
  //           // hintText: field['hinttext'],
  //           );
  //     case 'Choice':
  //       return CommonComponents.defaultDropdownSearch(context,
  //           title: fieldName,
  //           items: (field['choices'] as List),
  //           onChanged: (value) {
  //             // Handle the selected value
  //           },
  //           compareFn: (i, dynamic s) => i == s,
  //           itemAsString: (dynamic u) => u[1].toString());
  //     case 'Integer':
  //       return CommonComponents.defaultTextField(context, title: fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))]
  //           // hintText: field['hinttext'],
  //           );
  //     case 'Decimal':
  //       return CommonComponents.defaultTextField(context, title: fieldName, inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9,.]'))]
  //           // hintText: field['hinttext'],
  //           );
  //     case 'DateTime':
  //       return CommonComponents.defaultTextField(context, title: fieldName, readOnly: true, controller: TextEditingController(),
  //           // hintText: field['hinttext'],
  //           onTap: () async {
  //         final DateTime? picked = await showDatePicker(
  //                 context: context,
  //                 initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //                 lastDate: DateTime(
  //                   2025,
  //                 ),
  //                 firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day))
  //             .then((
  //           DateTime? date,
  //         ) async {
  //           if (date != null) {
  //             final time = await showTimePicker(
  //               context: context,
  //               initialTime: TimeOfDay.fromDateTime(date),
  //             );
  //             debugPrint("Date & Time ::::${DateTime(date.year, date.month, date.day, time!.hour, time.minute)}");
  //             return DateTime(date.year, date.month, date.day, time.hour, time.minute);
  //           } else {
  //             return null;
  //           }
  //         });
  //         debugPrint("Print Date Time :::::::${picked!.day}-${picked.month}-${picked.year}");
  //         debugPrintSynchronously("Print Date Time :::::::${picked.day}-${picked.month}-${picked.year}");
  //       });
  //     case 'Date':
  //       return CommonComponents.defaultTextField(context, title: fieldName, readOnly: true,
  //           // hintText: field['hinttext'],
  //           onTap: () async {
  //         final DateTime? picked = await showDatePicker(
  //             context: context,
  //             initialDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day),
  //             lastDate: DateTime(
  //               2025,
  //             ),
  //             firstDate: DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day));
  //         debugPrint("Print Date Time :::::::${picked!.day}-${picked.month}-${picked.year}");
  //         debugPrintSynchronously("Print Date Time :::::::${picked.day}-${picked.month}-${picked.year}");
  //       });
  //     case 'Time':
  //       return CommonComponents.defaultTextField(context, title: fieldName, readOnly: true,
  //           // hintText: field['hinttext'],
  //           onTap: () async {
  //         final TimeOfDay? picked = await showTimePicker(
  //           context: context,
  //           initialTime: TimeOfDay.fromDateTime(DateTime.now()),
  //         );
  //         // debugPrint("Date & Time ::::${DateTime(date.year, date.month, date.day, time!.hour,time.minute)}");
  //         // return TimeOfDay(date.year, date.month, date.day, time.hour,time.minute);
  //         debugPrint("Print Time :::::::${picked!.hour}:${picked.minute}");
  //       });
  //     case 'ForeignKey':
  //       return CommonComponents.defaultDropdownSearch(
  //         context,
  //         title: fieldName,
  //         asyncItems: (String? filter) async {
  //           await controller.fetchMasterList(
  //               'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/$fieldName/');
  //           return controller.masterList;
  //         },
  //         onChanged: (value) {
  //           // Handle the selected value
  //         },
  //         compareFn: (i, dynamic s) => i != null ? i[field['read_fields'][0]] == s[field['read_fields'][0]] : false,
  //         itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
  //       );
  //     case 'ManyToMany':
  //       return CommonComponents.defaultMultiSelectionDropdownSearch(
  //         context,
  //         title: fieldName,
  //         asyncItems: (String? filter) async {
  //           await controller.fetchMasterList(
  //               'http://dynamicdjango.dev.absol.in/dynamicdjango/mini/${controller.commonFormData.results!.first.appLabel}/${controller.commonFormData.results!.first.modelName}/$fieldName/');
  //           return controller.masterList;
  //         },
  //         onChanged: (value) {
  //           // Handle the selected value
  //         },
  //         selectedItem: [],
  //         compareFn: (i, dynamic s) => i != null ? i[field['read_fields'][0]] == s[field['read_fields'][0]] : false,
  //         itemAsString: (dynamic u) => u[field['read_fields'][0]].toString(),
  //       );
  //     default:
  //       return Container();
  //   }
  // }

  Widget renderField(String fieldName, Map<String, dynamic> field, BuildContext context) {

    switch (field['type']) {
      case 'Char':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9.]'));
      case 'Text':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[A-Za-z0-9./-]'));
      case 'Integer':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9]'));
      case 'Decimal':
        return FormComponents.instance.buildTextField(context, fieldName, RegExp('[0-9,.]'));
      case 'Choice':
        return FormComponents.instance.buildDropdown(context, fieldName, field['choices']);
      case 'DateTime':
        return FormComponents.instance.buildDateTimePicker(context, fieldName);
      case 'Date':
        return FormComponents.instance.buildDatePicker(context, fieldName);
      case 'Time':
        return FormComponents.instance.buildTimePicker(context, fieldName);
      case 'ForeignKey':
      case 'ManyToMany':
        return FormComponents.instance.buildAsyncDropdown(context, fieldName, field, isMultiSelect: field['type'] == 'ManyToMany');
      default:
        return Container();
    }
  }
}
