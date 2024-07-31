import 'package:flutter/material.dart';
import 'package:suitess/app/chat/content/chat_bubble_clipper.dart';
import 'package:suitess/src/constants/consts.dart';
import 'package:suitess/theme/colors.dart';

chatBubble(
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
            clipper: ChatBubbleClipper(isSender: isSender ?? false),
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
