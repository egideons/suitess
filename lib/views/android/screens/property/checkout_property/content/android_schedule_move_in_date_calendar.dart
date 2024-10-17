import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../../../../constants/consts.dart';
import '../../../../../../controllers/app/checkout_property_controller.dart';
import '../../../../../../theme/colors.dart';

androidScheduleMoveInDateCalendar(
  CheckoutPropertyController controller,
  ColorScheme colorScheme,
) {
  return TableCalendar(
    firstDay: DateTime.utc(1940, 01, 01),
    lastDay: DateTime.utc(2124, 12, 31),
    focusedDay: controller.selectedDay,
    onDaySelected: controller.onDaySelected,
    availableGestures: AvailableGestures.all,
    selectedDayPredicate: (day) => isSameDay(day, controller.selectedDay),
    startingDayOfWeek: StartingDayOfWeek.monday,
    rowHeight: 40,
    daysOfWeekHeight: 20,
    calendarFormat: CalendarFormat.month,
    headerStyle: HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      titleTextStyle: defaultTextStyle(
        fontSize: 14,
        color: kTextBoldHeadingColor,
      ),
    ),
    calendarStyle: CalendarStyle(
      isTodayHighlighted: true,
      outsideDaysVisible: false,
      outsideTextStyle: defaultTextStyle(
        fontSize: 12,
        color: kTextGreyColor.withOpacity(.6),
      ),
      holidayTextStyle: defaultTextStyle(
        fontSize: 12,
        color: kTextBoldHeadingColor,
      ),
      weekendTextStyle: defaultTextStyle(
        fontSize: 12,
        color: kTextBoldHeadingColor,
      ),
      defaultTextStyle: defaultTextStyle(
        fontSize: 12,
        color: kTextBoldHeadingColor,
      ),
      todayDecoration: ShapeDecoration(
        color: colorScheme.secondary.withOpacity(.4),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
      selectedDecoration: ShapeDecoration(
        color: colorScheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
        ),
      ),
    ),
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
        return formatter.format(date).substring(0, 1).toUpperCase();
      },
    ),
  );
}
