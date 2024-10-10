import 'package:flutter/material.dart';
import 'package:suitess/constants/consts.dart';
import 'package:suitess/theme/colors.dart';
import 'package:suitess/views/android/screens/chat/content/android_chat_bubble_clipper.dart';

androidChatBubble(
  Size media, {
  void Function()? onTap,
  String? message,
  bool? isSender,
  bool? showTime,
}) {
  return Align(
    alignment: isSender ?? false ? Alignment.centerRight : Alignment.centerLeft,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: onTap,
          child: ClipPath(
            clipper: AndroidChatBubbleClipper(isSender: isSender ?? false),
            child: Container(
              padding: const EdgeInsets.all(10),
              constraints: BoxConstraints(maxWidth: media.width * 0.7),
              decoration: ShapeDecoration(
                color: isSender ?? false ? kUserChatColor : kSenderChatColor,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),
              child: SelectableText(
                message ?? "",
                textAlign: TextAlign.start,
                style: defaultTextStyle(
                  color: kTextGreyColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        kSmallSizedBox,
        if (showTime == true) ...[
          Text(
            // format12HrTime(time ?? DateTime.now()),
            format12HrTime(DateTime.now()),
            textAlign: TextAlign.start,
            style: defaultTextStyle(
              color: kTextGreyColor,
              fontSize: 10,
              fontWeight: FontWeight.w400,
            ),
          ),
        ]
      ],
    ),
  );
}
