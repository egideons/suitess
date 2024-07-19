import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:suitess/src/controllers/app/view_property_controller.dart';

import '../../../../../../theme/colors.dart';

class ViewPropertyScaffold extends GetView<ViewPropertyController> {
  const ViewPropertyScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;

    var controller = ViewPropertyController.instance;

    return Scaffold(
      backgroundColor: colorScheme.surface,
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: kAccentColor,
                foregroundColor: kLightBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      body: Scrollbar(
        controller: controller.scrollController,
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: colorScheme.surface,
              elevation: 0,
              pinned: true,
              centerTitle: false,
              expandedHeight: 300,
              leading: IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(
                  Icons.chevron_left,
                  color: colorScheme.surface,
                  size: 30,
                ),
              ),
              flexibleSpace: Stack(
                children: [
                  PageView.builder(
                    controller: controller.imageController.value,
                    itemCount: controller.propertyImages.length,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return FlexibleSpaceBar(
                        background: Image(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            controller.propertyImages[index],
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    top: media.height / 2.6,
                    left: media.width / 2.3,
                    child: SmoothPageIndicator(
                      controller: controller.imageController.value,
                      count: controller.propertyImages.length,
                      onDotClicked: (index) {
                        controller.imageController.value.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                        controller.imageController.value.animateToPage(
                          index,
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.easeIn,
                        );
                      },
                      effect: SlideEffect(
                        spacing: 10,
                        dotWidth: 10,
                        dotHeight: 10,
                        radius: 20.0,
                        paintStyle: PaintingStyle.stroke,
                        strokeWidth: 1.0,
                        type: SlideType.slideUnder,
                        dotColor: colorScheme.surface,
                        activeDotColor: colorScheme.surface,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverToBoxAdapter(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Center(
                      child: Container(
                        height: 5,
                        width: 40,
                        decoration: ShapeDecoration(
                          color: colorScheme.inversePrimary.withOpacity(.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
