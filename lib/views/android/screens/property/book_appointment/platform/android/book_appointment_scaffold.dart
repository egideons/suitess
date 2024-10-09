import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/controllers/app/book_appointment_controller.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/utils/buttons/android/android_elevated_button.dart';
import 'package:suitess/utils/components/circle_avatar_image.dart';
import 'package:suitess/utils/components/my_app_bar.dart';
import 'package:suitess/views/android/splash/successful/screen/android_success_screen.dart';

import '../../content/book_appointment_calendar.dart';
import '../../content/reference_booking_apartment.dart';

class BookAppointmentScaffold extends GetView<BookAppointmentController> {
  const BookAppointmentScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: colorScheme.surface,
      appBar: myAppBar(colorScheme, media, title: "Book appointment"),
      body: SafeArea(
        child: GetBuilder<BookAppointmentController>(
          init: BookAppointmentController(),
          builder: (controller) {
            return Scrollbar(
              child: ListView(
                padding: const EdgeInsets.all(20),
                children: [
                  Text(
                    "Available dates",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  kHalfSizedBox,
                  Container(
                    decoration: ShapeDecoration(
                      color: colorScheme.surface,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(
                          width: .2,
                          color: colorScheme.inversePrimary,
                        ),
                      ),
                      shadows: [
                        BoxShadow(
                          blurRadius: 2,
                          spreadRadius: 0,
                          color: colorScheme.inversePrimary.withOpacity(.2),
                          offset: const Offset(0, 2),
                        )
                      ],
                    ),
                    child: bookAppointmentCalender(controller, colorScheme),
                  ),
                  kSizedBox,
                  Text(
                    "Time preference",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  kHalfSizedBox,
                  SizedBox(
                    height: 30,
                    child: ListView.separated(
                      itemCount: controller.timeOfDayList.length,
                      separatorBuilder: (context, index) => kSmallWidthSizedBox,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final timeOfDayModel = controller.timeOfDayList[index];
                        return InkWell(
                          onTap: () {
                            controller.selectTimeOfDay(index);
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 5,
                            ),
                            decoration: ShapeDecoration(
                              color: timeOfDayModel.isSelected
                                  ? colorScheme.secondary
                                  : kGreyColor.withOpacity(.1),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(4),
                              ),
                            ),
                            child: Text(
                              timeOfDayModel.time,
                              style: defaultTextStyle(
                                fontSize: 12,
                                color: timeOfDayModel.isSelected
                                    ? kTextWhiteColor
                                    : colorScheme.inversePrimary,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  kBigSizedBox,
                  Text(
                    "Appointment details",
                    style: defaultTextStyle(
                      color: kTextBoldHeadingColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                    ),
                  ),
                  kSizedBox,
                  Text(
                    "Appointment with:",
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  kHalfSizedBox,
                  Row(
                    children: [
                      circleAvatarImage(
                        colorScheme,
                      ),
                      kHalfWidthSizedBox,
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ifeanyi Okigbo",
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Realtor",
                            style: defaultTextStyle(
                              color: kTextBoldHeadingColor,
                              fontSize: 10,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  kHalfSizedBox,
                  Text(
                    "Reference apartment:",
                    style: defaultTextStyle(
                      color: kTextGreyColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  kHalfSizedBox,
                  referenceBookingApartment(
                    colorScheme,
                    media,
                    propertyName: "4 Flats Woodland Apartment",
                    propertyLocation: "Independence layout, Enugu",
                    numOfBaths: 2,
                    numOfBeds: 4,
                    tradeType: "Rent",
                  ),
                  kBigSizedBox,
                  AndroidElevatedButton(
                    title: "Book now",
                    onPressed: () async {
                      await Get.off(
                        () => const AndroidSuccessScreen(),
                        routeName: "/success",
                        fullscreenDialog: true,
                        curve: Curves.easeInOut,
                        preventDuplicates: true,
                        popGesture: false,
                        transition: Get.defaultTransition,
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
