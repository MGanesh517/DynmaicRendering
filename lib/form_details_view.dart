import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Common/form_components.dart';
import 'Controllers/common_controllers.dart';

class FormDetailsView extends StatefulWidget {
  const FormDetailsView({super.key, required this.title});

  final String title;

  @override
  State<FormDetailsView> createState() => _FormDetailsViewState();
}

class _FormDetailsViewState extends State<FormDetailsView> {
  // var db = mongo.Db('mongodb://test:test123@cluster0.8fz6oli.mongodb.net/myDatabase?retryWrites=true&w=majority');
  // var db = mongo.Db(
  //     'mongodb://test:test123@cluster0-shard-00-00.8fz6oli.mongodb.net:27017,cluster0-shard-00-01.8fz6oli.mongodb.net:27017,cluster0-shard-00-02.8fz6oli.mongodb.net:27017/myDatabase?replicaSet=atlas-4wd-shard-0&ssl=true&authSource=admin');

  dbConnect() async {
    // try{
    //
    //   await db.open();
    //   print('Connected to MongoDB');
    //
    //   // Create a new collection
    //   await createCollection(db);
    //
    //   await db.close();
    //   print('Connection closed');
    //  }catch(error){
    //   print("Print Db Connect Error:$error");
    // }
  }

  // Future<void> createCollection(mongo.Db db) async {
  //   // Replace 'new_collection' with the name of your collection
  //   var collectionName = 'Users';
  //
  //   // Check if the collection already exists
  //   var existingCollections = await db.getCollectionNames();
  //   if (!existingCollections.contains(collectionName)) {
  //     // Create a new collection
  //     await db.createCollection(collectionName);
  //     print('Collection "$collectionName" created.');
  //   } else {
  //     print('Collection "$collectionName" already exists.');
  //   }
  // }

  final controller = Get.put(MiniController());
  // List<dynamic> formsData = [
  //   // {"id":"mobile_number","label": "Mobile Number","name":"Mobile Number","type":"number"},
  //   // {"id":"name","label": "Name","name":"Name","type":"text"},
  //   // {"id":"amount","label": "Amount","name":"Amount","type":"number"},
  //   // {"id":"bank_id","label": "Bank Name","name":"Bank Name","type":"select",
  //   //   "options":[
  //   //     {"text":"hbl Bank","value":"hbl"},
  //   //     {"text":"City Bank","value":"city"},
  //   //     {"text":"ubl","value":"ubl"}
  //   //   ]
  //   // },
  //   // {"id":"send_now","label": "Amount","name":"Send now?","type":"radio",
  //   //   "choices": [
  //   //     {"label":"Yes","value":"yes"},
  //   //     {"label":"No","value":"no"}
  //   //   ]
  //   // }
  //   {
  //     "type": 'text',
  //     "label": "First Name",
  //     "hintText": "Enter First Name",
  //     // "isPassword": false,
  //     "maxLength": 100,
  //     "maxLines": 1,
  //     "inputFormat": RegExp(''),
  //     "validationMsg": '',
  //     "inputType": "Text/Number/Decimal",
  //     "inputKeyBoardAction": "Next/Done/Submit",
  //   },
  //   {
  //     "type": 'text',
  //     "label": "Password",
  //     "validation": (String? val) {
  //       if (val!.isEmpty) {
  //         return "Please Enter Password";
  //       } else {
  //         return null;
  //       }
  //     },
  //     "hintText": "Enter Password",
  //     "isPassword": true,
  //     "maxLength": 100,
  //     "maxLines": 1,
  //     "inputFormat": RegExp('0'),
  //   },
  //   {"type": 'select', "label": "Locations", "hintText": "Select Option", "isPassword": false, "url": "", "items": [], "SelectedValue": 'Name/Code'},
  //   {
  //     "type": 'radio',
  //     "label": "Gender",
  //     "groupVal": 1,
  //     "choices": [
  //       {
  //         "label": 'Male',
  //         "value": "1",
  //       },
  //       {
  //         "label": 'FeMale',
  //         "value": "2",
  //       }
  //     ],
  //     "hintText": "Select Option",
  //     "isPassword": false,
  //   },
  //   {
  //     "type": 'choice',
  //     "label": "Vehicles",
  //     "groupVal": 1,
  //     "choices": [
  //       {
  //         "label": 'Car',
  //         "value": false,
  //       },
  //       {
  //         "label": 'Bike',
  //         "value": false,
  //       }
  //     ],
  //     "hintText": "Select Option",
  //     "isPassword": false,
  //   }
  // ];
  //
  // var fieldsDictList = {
  //   'name': {
  //     'type': 'Char',
  //     'required': false,
  //     'max_length': 100,
  //     'min_length': 1,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'description': {
  //     'type': 'Text',
  //     'required': false,
  //     'max_length': 1000,
  //     'min_length': 5,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'gender': {
  //     'type': 'Choice',
  //     'required': false,
  //     'default': 1,
  //     'choices': [
  //       [1, 'Male'],
  //       [2, 'Female'],
  //       [3, 'Others']
  //     ],
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'age': {
  //     'type': 'Integer',
  //     'required': false,
  //     'default': 0,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'datetime': {
  //     'type': 'DateTime',
  //     'required': false,
  //     'read_only': true,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'date': {
  //     'type': 'Date',
  //     'required': false,
  //     'read_only': true,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'time': {
  //     'type': 'Time',
  //     'required': false,
  //     'read_only': true,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'duration': {
  //     'type': 'Duration',
  //     'required': false,
  //     'read_only': true,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'radius': {
  //     'type': 'Decimal',
  //     'required': false,
  //     'max_digits': 9,
  //     'decimal_places': 2,
  //     'default': 0,
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'groups': {
  //     'type': 'ManyToMany',
  //     'to': 'auth.Group',
  //     'read_fields': ['name'],
  //     'filter_data': {},
  //     'required': true,
  //     'related_name': 'sample_show_multi',
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'grp': {
  //     'type': 'ForeignKey',
  //     'to': 'auth.Group',
  //     'read_fields': ['name'],
  //     'filter_data': {},
  //     'required': false,
  //     'related_name': 'sample_show',
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'createdby': {
  //     'type': 'ForeignKey',
  //     'to': 'Users.user',
  //     'read_fields': ['username'],
  //     'filter_data': {},
  //     'required': false,
  //     'related_name': 'sample_show_created_dy',
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'modifiedby': {
  //     'type': 'ForeignKey',
  //     'to': 'Users.user',
  //     'read_fields': ['username'],
  //     'filter_data': {},
  //     'required': false,
  //     'related_name': 'sample_show_modify_by',
  //     'show_in_view': true,
  //     'show_in_report': true,
  //     'show_in_edit': true,
  //     'show_in_filter': true,
  //     'show_in_list': true,
  //     'show_in_add': true
  //   },
  //   'is_deleted': {
  //     'type': 'Boolean',
  //     'default': false,
  //     'required': false,
  //     'show_in_view': false,
  //     'show_in_report': false,
  //     'show_in_edit': false,
  //     'show_in_filter': false,
  //     'show_in_list': false,
  //     'show_in_add': false
  //   },
  // };
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  void initState() {
    dbConnect();
    // initializeFieldValues();
    // initializeLatestFieldValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: <Widget>[
      //    Expanded(
      //      child: Form(
      //        key: formKey,
      //        child: ListView.builder(
      //            itemCount: formsData.length,
      //            itemBuilder: (context,index){
      //          return Padding(
      //            padding: const EdgeInsets.all(8.0),
      //            child: Column(
      //              children: [
      //                buildField(formsData[index]),
      //              ],
      //            ),
      //          );
      //        }),
      //      ),
      //    )
      //   ],
      // ),
      body: GetBuilder<MiniController>(
        initState: (_) => MiniController.to.initFormState(),
        builder: (value) => Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Obx(
                  () {
                List<dynamic> widgetList = controller.commonFormDetails.fields != null
                // ? controller.commonFormData.results!.first.fields.entries.map((entry) {
                //     // print("Print FADASSDSSS :::${entry.key}");
                //     // print("Print FADASSDSSS :::${entry.value}");
                //     return Padding(
                //       padding: const EdgeInsets.symmetric(vertical: 8.0),
                //       child: renderField(entry.key, entry.value),
                //     );
                //   }).toList()
                    ? controller.commonFormDetails.fields.entries.map((entry) {
                  // print("Print FADASSDSSS :::${entry.key}");
                  // print("Print FADASSDSSS :::${entry.value}");
                  // print("Print FADASSDSSS :::${controller.commonFormData.results!.last.fields.length}");
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: renderField(entry.key,entry.value ,context),
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
          } catch (error) {
            debugPrint("Print Db Connect Error:$error");
          }
          if(formKey.currentState!.validate()){
            debugPrint("Print From Data ");
          }

          // Get.to(ExampleCard(candidates[0]));
          // Navigator.push(context, MaterialPageRoute(builder: (context) => TinderCard(),));
        },
        child: const Icon(Icons.send),
      ),
    );
  }

  Color getColor(Set<WidgetState> states) {
    const Set<WidgetState> interactiveStates = <WidgetState>{
      WidgetState.pressed,
      WidgetState.hovered,
      WidgetState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.orangeAccent;
    }
    return Colors.white;
  }
  Widget renderField(String fieldName, Map<String, dynamic> field, BuildContext context) {

    switch (field['type']) {
      case 'Char':
      // case 'Text':
      // case 'Integer':
      // case 'Decimal':
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
// var fieldsDict = {
//   'name': {'type': 'Char', 'required': false, 'max_length': 100, 'min_length': 1},
//   'description': {'type': 'Text', 'required': false, 'max_length': 1000, 'min_length': 5},
//   'gender': {
//     'type': 'Choice',
//     'required': false,
//     'default': 1,
//     'choices': [
//       [1, 'Male'],
//       [2, 'Female'],
//       [3, 'Others']
//     ]
//   },
//   'age': {'type': 'Integer', 'required': false, 'default': 0},
//   'datetime': {
//     'type': 'DateTime',
//     'required': false,
//     'format': '%d-%m-%Y %I:%M %p',
//     'input_formats': ['%d-%m-%Y %I:%M %p'],
//     'read_only': true
//   },
//   'date': {
//     'type': 'Date',
//     'required': false,
//     'format': '%d-%m-%Y',
//     'input_formats': ['%d-%m-%Y'],
//     'read_only': true
//   },
//   'time': {
//     'type': 'Time',
//     'required': false,
//     'format': '%I:%M %p',
//     'input_formats': ['%I:%M %p'],
//     'read_only': true
//   },
//   'duration': {
//     'type': 'Duration',
//     'required': false,
//     'format': '%d-%m-%Y %I:%M %p',
//     'input_formats': ['%d-%m-%Y %I:%M %p'],
//     'read_only': true
//   },
//   'radius': {'type': 'Decimal', 'required': false, 'max_digits': 9, 'decimal_places': 2, 'default': 0},
//   'groups': {
//     'type': 'ManyToMany',
//     'to': 'auth.Group',
//     'read_fields': ['name'],
//     'required': true
//   },
//   'grp': {
//     'type': 'ForeignKey',
//     'to': 'auth.Group',
//     'read_fields': ['name'],
//     'required': false
//   },
// };
// var formDataList = {
//   "success": true,
//   "service_name": "send money",
//   "image_url":
//       "https://images.unsplash.com/photo-1461749280684-dccba630e2f6?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80",
//   "fields": [
//     {"id": "mobile_number", "name": "Mobile Number", "type": "number"},
//     {"id": "amount", "name": "Amount", "type": "number"},
//     {
//       "id": "bank_id",
//       "name": "Bank Name",
//       "type": "select",
//       "options": [
//         {"text": "hbl Bank", "value": "hbl"},
//         {"text": "City Bank", "value": "city"},
//         {"text": "ubl", "value": "ubl"}
//       ]
//     },
//     // {"id":"send_now","name":"Send now?","type":"radio",
//     //   "options": [
//     //   {"text":"Yes","value":"yes"},
//     //     {"text":"No","value":"no"}
//     // ]
//     // }
//   ]
// };
// Map<String, dynamic> fieldValues = {};
//
// // Initialize field values to store form data
// void initializeFieldValues() {
//   fieldsDict.forEach((key, field) {
//     fieldValues[key] = field['default'] ?? null;
//   });
// }
//
// void initializeLatestFieldValues() {
//   fieldsDictList.forEach((key, field) {
//     fieldValues[key] = field['default'] ?? null;
//   });
// }

// Method to render the appropriate input widget based on type


}