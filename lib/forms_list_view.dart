import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Controllers/common_controllers.dart';

class FormsListView extends StatelessWidget {
  FormsListView({super.key});
  final controller = Get.put(MiniController());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dynamic Forms"),
        backgroundColor: Get.theme.colorScheme.primary,
      ),
      body: GetBuilder<MiniController>(
        initState: (_) => MiniController.to.initFormState(),
        builder: (value) => Column(
          children: [
            Expanded(
              child: Obx(()=>
              controller.commonFormData.results!=null?ListView.builder(
                itemCount: controller.commonFormData.results!.length,
                itemBuilder: (buildcontex,index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      onTap: ()async{
                        await controller.getFormDetails(controller.commonFormData.results![index].id);
                      },
                      shape: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                          borderSide: BorderSide(color: Get.theme.colorScheme.primary.withOpacity( 0.1)),
                          gapPadding: 10
                      ),
                      style: ListTileStyle.drawer,
                      title: Text("${controller.commonFormData.results![index].modelName}"),
                      subtitle: Text("${controller.commonFormData.results![index].appLabel}"),
                    ),
                  );
                },
              ):const Center(child: Text("No Records Found"),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
