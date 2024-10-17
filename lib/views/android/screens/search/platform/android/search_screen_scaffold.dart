import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/components/my_app_bar.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/search_screen_controller.dart';
import '../../../property/view_property/screen/android_view_property_screen.dart';
import '../../content/num_of_search_results_and_filter.dart';
import '../../content/search_result_container.dart';

class SearchScreenScaffold extends GetView<SearchScreenController> {
  const SearchScreenScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      floatingActionButton: Obx(
        () => controller.isScrollToTopBtnVisible.value
            ? FloatingActionButton.small(
                onPressed: controller.scrollToTop,
                backgroundColor: colorScheme.secondary,
                foregroundColor: kWhiteBackgroundColor,
                child: const Icon(Icons.keyboard_arrow_up),
              )
            : const SizedBox(),
      ),
      appBar: myAppBar(
        colorScheme,
        media,
        leadingWidth: 34,
        backgroundColor: colorScheme.surface,
        automaticallyImplyLeading: false,
        titleWidget: CupertinoSearchTextField(
          autocorrect: true,
          keyboardType: TextInputType.text,
          suffixMode: OverlayVisibilityMode.editing,
          autofocus: true,
          enableIMEPersonalizedLearning: true,
          controller: controller.searchEC,
          placeholder: "Search",
          style: defaultTextStyle(
            color: kTextGreyColor,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          placeholderStyle: defaultTextStyle(
            color: colorScheme.primary.withOpacity(.5),
            fontWeight: FontWeight.normal,
          ),
          onSubmitted: (value) {},
          onChanged: (value) {},
        ),
      ),
      body: SafeArea(
        child: RefreshIndicator.adaptive(
          onRefresh: controller.onRefresh,
          backgroundColor: colorScheme.surface,
          color: colorScheme.inversePrimary,
          child: Scrollbar(
            controller: controller.scrollController,
            child: GetBuilder<SearchScreenController>(
                init: SearchScreenController(),
                builder: (controller) {
                  return CustomScrollView(
                    controller: controller.scrollController,
                    slivers: [
                      SliverAppBar(
                        backgroundColor: colorScheme.surface,
                        elevation: 0,
                        stretch: true,
                        pinned: true,
                        automaticallyImplyLeading: false,
                        leadingWidth: 0,
                        scrolledUnderElevation: 0,
                        bottom: const PreferredSize(
                          preferredSize: Size.fromHeight(-10.0),
                          child: SizedBox(),
                        ),
                        title: searchResultsAndFilter(
                          colorScheme,
                          492,
                          () {
                            controller.showSearchFilterBottomModalSheet(
                              context,
                              media,
                            );
                          },
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: ListView.separated(
                          itemCount: 20,
                          shrinkWrap: true,
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.all(10),
                          separatorBuilder: (context, index) => kHalfSizedBox,
                          itemBuilder: (context, index) {
                            return searchResultContainer(
                              colorScheme,
                              media,
                              onTap: () async {
                                // Get.toNamed(
                                //   Routes.viewProperty,
                                //   preventDuplicates: true,
                                // );
                                await Get.to(
                                  () => const AndroidViewPropertyScreen(),
                                  routeName: "/view-property",
                                  fullscreenDialog: true,
                                  curve: Curves.easeInOut,
                                  preventDuplicates: true,
                                  popGesture: false,
                                  transition: Get.defaultTransition,
                                );
                              },
                              tradeType: "Sale",
                              propertyName: "4 Flats Woodland Apartment",
                              propertyPrice: 350000,
                              paymentFreq: "Year",
                              propertyLocation: "Independence layout, Enugu",
                              numOfBeds: 4,
                              numOfBaths: 2,
                            );
                          },
                        ),
                      )
                    ],
                  );
                }),
          ),
        ),
      ),
    );
  }
}
