import 'package:flutter/cupertino.dart';

void showKYCChooseCountryCupertinoPopup(context, media, controller) {
  showCupertinoModalPopup(
    context: context,
    builder: (context) {
      return SizedBox(
        height: media.height * 0.2,
        child: CupertinoPicker(
          itemExtent: controller.countries.length,
          onSelectedItemChanged: (index) {
            // setState(() {
            //   _selectedIndex = index;
            // });
          },
          children: List.generate(
            controller.countries.length,
            (index) {
              return Center(
                child: Text('Option $index'),
              );
            },
          ),
        ),
      );
    },
  );
}
