import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/circle_avatar_image.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../src/constants/assets.dart';
import '../../../../../../src/controllers/app/book_appointment_controller.dart';

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
                    child: TableCalendar(
                      firstDay: DateTime.utc(1940, 01, 01),
                      lastDay: DateTime.utc(2124, 12, 31),
                      focusedDay: DateTime.now(),
                      startingDayOfWeek: StartingDayOfWeek.monday,
                      calendarStyle: CalendarStyle(
                        isTodayHighlighted: true,
                        todayDecoration: ShapeDecoration(
                          color: kAccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                        selectedDecoration: ShapeDecoration(
                          color: kAccentColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      ),
                      daysOfWeekHeight: 20,
                      calendarFormat: CalendarFormat.month,
                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        weekendStyle: defaultTextStyle(
                          color: kTextBoldHeadingColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 12,
                        ),
                        dowTextFormatter: (date, locale) {
                          // Format the day of the week to the first letter in capital
                          final formatter = DateFormat.E(locale);
                          return formatter
                              .format(date)
                              .substring(0, 1)
                              .toUpperCase();
                        },
                      ),
                    ),
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
                                  ? kAccentColor
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
                  referenceApartment(
                    colorScheme,
                    media,
                    propertyName: "4 Flats Woodland Apartment",
                    propertyLocation: "Independence layout, Enugu",
                    numOfBaths: 2,
                    numOfBeds: 4,
                    tradeType: "Sale",
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  referenceApartment(
    ColorScheme colorScheme,
    Size media, {
    String? tradeType,
    String? propertyName,
    String? propertyLocation,
    int? numOfBeds,
    int? numOfBaths,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: media.height * .15,
          width: media.width * .300,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
            image: const DecorationImage(
              image: AssetImage(Assets.duplex1),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kHalfWidthSizedBox,
        Expanded(
          child: Column(
            children: [
              Text(
                propertyName ?? "",
                textAlign: TextAlign.start,
                overflow: TextOverflow.ellipsis,
                style: defaultTextStyle(
                  fontSize: 14,
                  color: kTextBoldHeadingColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
              kSmallSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    height: 20,
                    width: 20,
                    Assets.locationPinOutlineIconSvg,
                    color: colorScheme.primary.withOpacity(.5),
                    fit: BoxFit.contain,
                  ),
                  Expanded(
                    child: Text(
                      propertyLocation ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: defaultTextStyle(
                        fontSize: 12,
                        color: colorScheme.inversePrimary,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ],
              ),
              kHalfSizedBox,
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        height: 20,
                        width: 20,
                        Assets.bedOutlineSvg,
                        color: colorScheme.primary.withOpacity(.5),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        numOfBeds == 1 ? "$numOfBeds Bed" : "$numOfBeds Beds",
                        overflow: TextOverflow.ellipsis,
                        style: defaultTextStyle(
                          fontSize: 10,
                          color: colorScheme.inversePrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  kWidthSizedBox,
                  Row(
                    children: [
                      SvgPicture.asset(
                        height: 20,
                        width: 20,
                        Assets.bathOutlineSvg,
                        color: colorScheme.primary.withOpacity(.5),
                        fit: BoxFit.contain,
                      ),
                      Text(
                        numOfBaths == 1
                            ? "$numOfBaths Bath"
                            : "$numOfBaths Baths",
                        overflow: TextOverflow.ellipsis,
                        style: defaultTextStyle(
                          fontSize: 10,
                          color: colorScheme.inversePrimary,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              kHalfSizedBox,
              Row(
                children: [
                  Text(
                    "Status:",
                    style: defaultTextStyle(
                      fontSize: 12,
                      color: kGreyColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: ShapeDecoration(
                      color: kBannerBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        tradeType ?? "",
                        textAlign: TextAlign.center,
                        style: defaultTextStyle(
                          fontSize: 10,
                          color: kBannerTextColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
