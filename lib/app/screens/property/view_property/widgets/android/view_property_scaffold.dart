import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/src/controllers/app/view_property_controller.dart';

class ViewPropertyScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = ViewPropertyController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      body: Stack(
        children: [
          SizedBox(
            width: media.width,
            height: media.height / 2,
            child: PageView.builder(
              // onPageChanged: (index) => controller.setIsLastPage(index),
              controller: controller.imageController.value,
              itemCount: controller.propertyImages.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: media.height * .58,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      image: DecorationImage(
                        image: AssetImage(
                          controller.propertyImages[index],
                        ),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
