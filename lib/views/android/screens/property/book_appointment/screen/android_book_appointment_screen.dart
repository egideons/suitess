import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../controllers/app/book_appointment_controller.dart';
import '../content/android_book_appointment_scaffold.dart';

class AndroidBookAppointmentScreen extends StatelessWidget {
  const AndroidBookAppointmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //Initialize the controller
    Get.put(BookAppointmentController());

    return GestureDetector(
      onTap: (() => FocusManager.instance.primaryFocus?.unfocus()),
      child: const AndroidBookAppointmentScaffold(),
    );
  }
}
