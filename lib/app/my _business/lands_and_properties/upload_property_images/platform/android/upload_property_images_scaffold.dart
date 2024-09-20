import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:suitess/src/constants/assets.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/controllers/app/upload_property_images_controller.dart';
import 'package:suitess/src/utils/buttons/android/android_elevated_button.dart';

import '../../../../../../src/utils/components/my_app_bar.dart';
import '../../../../../../theme/colors.dart';

class UploadPropertyImagesScaffold
    extends GetView<UploadPropertyImagesController> {
  const UploadPropertyImagesScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(
        colorScheme,
        media,
        title: "Upload Images",
        bottom: PreferredSize(
          preferredSize: Size(media.width, 10),
          child: Text(
            "Edit photos of the properties to be listed",
            style: defaultTextStyle(
              color: kTextGreyColor,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
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
      body: SafeArea(
        child: Scrollbar(
          child: SingleChildScrollView(
            controller: controller.scrollController,
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                kBigSizedBox,
                kBigSizedBox,
                InkWell(
                  onTap: () {},
                  borderRadius: BorderRadius.circular(8),
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(8),
                    padding: const EdgeInsets.all(0),
                    strokeWidth: 2,
                    dashPattern: const [4, 4],
                    color: const Color(0xFFC2C2C2),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 80,
                        ),
                        decoration: ShapeDecoration(
                          color: kFrameBackgroundColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            // kBigSizedBox,
                            // kBigSizedBox,
                            SvgPicture.asset(
                              height: 80,
                              width: 80,
                              fit: BoxFit.contain,
                              Assets.imageOutline2Svg,
                            ),
                            kSizedBox,
                            Row(
                              children: [
                                Icon(
                                  Icons.file_upload_outlined,
                                  color: kTextBoldHeadingColor,
                                ),
                                kHalfWidthSizedBox,
                                Expanded(
                                  child: Text(
                                    "Upload images or Drag and drop images ",
                                    style: defaultTextStyle(
                                      color: kTextGreyColor,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            kSizedBox,
                            Text(
                              "JPEG, JPG, PNG\nUp to 48mb\nMinimum resolution 0000 x 0000",
                              textAlign: TextAlign.center,
                              style: defaultTextStyle(
                                color: kTextGreyColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            // kBigSizedBox,
                            // kBigSizedBox,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                kBigSizedBox,
                Obx(() {
                  return AndroidElevatedButton(
                    title: "Publish",
                    isLoading: controller.isLoading.value,
                    onPressed: controller.publish,
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
