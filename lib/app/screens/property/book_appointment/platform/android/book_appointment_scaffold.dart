import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/src/utils/components/my_app_bar.dart';
import 'package:suitess/theme/colors.dart';
import 'package:table_calendar/table_calendar.dart';

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
        child: Scrollbar(
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
            ],
          ),
        ),
      ),
    );
  }
}
